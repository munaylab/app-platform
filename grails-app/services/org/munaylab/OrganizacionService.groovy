package org.munaylab

import org.munaylab.contacto.Contacto
import org.munaylab.contacto.ContactoCommand
import org.munaylab.contacto.TipoContacto
import org.munaylab.direccion.Domicilio
import org.munaylab.osc.Organizacion
import org.munaylab.osc.OrganizacionCommand
import org.munaylab.osc.EstadoOrganizacion
import org.munaylab.osc.RegistroCommand
import org.munaylab.user.User
import org.munaylab.security.ConfirmacionCommand
import org.munaylab.security.Token
import org.munaylab.security.TipoToken
import org.munaylab.utils.TipoEmail
import grails.gorm.transactions.Transactional

@Transactional
class OrganizacionService {

    def emailService
    def securityService
    def springSecurityService

    Organizacion registrar(RegistroCommand command) {
        if (!command || !command.validate())
            return null

        User representante = command.representante
        Contacto email = new Contacto(tipo: TipoContacto.EMAIL, value: command.email)
        Contacto telefono = new Contacto(tipo: TipoContacto.TELEFONO, value: command.telefono)
        representante.addToContactos(email)
        representante.addToContactos(telefono)

        Organizacion org = command.organizacion
        org.addToAdmins(representante)
        org.save()

        if (!org.hasErrors()) {
            log.info "organizacion registrada id = ${org.id}"
            Token token = securityService.generarTokenConfirmacion(representante)
            emailService.enviarRegistroOrg(representante, org, token.value)
        } else {
            log.warn "organizacion con errores ${org.errors.allErrors}"
        }
        return org
    }

    @Transactional(readOnly = true)
    def datosConfirmacion(String codigo) {
        Token token = securityService.validarToken(codigo, TipoToken.CONFIRMACION)
        if (!token) return [null, null, null]

        Organizacion org = Organizacion.withCriteria(uniqueResult: true) {
            admins {
                eq 'id', token.user.id
            }
            eq 'estado', EstadoOrganizacion.PENDIENTE
        }
        [token, token.user, org]
    }

    void confirmar(ConfirmacionCommand command) {
        if (command.hasErrors()) return null

        def (token, user, org) = datosConfirmacion(command.codigo)
        if (!token) return null

        org.estado = EstadoOrganizacion.REGISTRADA
        org.save()
        token.enabled = false
        token.save()
        user.accountLocked = false
        user.password = command.password1
        user.save()

        log.info "organizacion confirmada id = ${org.id}"
        emailService.enviarBienvenidaOrg(user, org)

        springSecurityService.reauthenticate(user.username)
    }

    @Transactional(readOnly = true)
    List<Organizacion> getOrganizacionesPendientes() {
        Organizacion.findAllByEstadoAndEnabled(EstadoOrganizacion.PENDIENTE, true)
    }

    @Transactional(readOnly = true)
    List<Organizacion> getOrganizacionesRegistradas() {
        Organizacion.findAllByEstadoAndEnabled(EstadoOrganizacion.REGISTRADA, true)
    }

    Organizacion guardar(OrganizacionCommand command) {
        if (!command || !command.validate()) return null

        Organizacion org = Organizacion.findByIdAndEstado(command.id, EstadoOrganizacion.VERIFICADA)
        if (org == null || !org.enabled) return null

        org.actualizarDatos(command)
        org.save()
        if (command.domicilio) {
            if (!org.domicilio) org.domicilio = new Domicilio()
            org.domicilio.actualizarDatos(command.domicilio)
            org.domicilio.save()
        }
        return org
    }

    Organizacion agregarContacto(Organizacion org, ContactoCommand command) {
        if (!command || !command.validate()) return

        Contacto contacto = command.id ? Contacto.get(command.id) : null
        if (contacto) {
            org.removeFromContactos(contacto)
            contacto.delete()
            org.contactos.clear()
        } else {
            org.addToContactos(new Contacto(command.properties))
            org.save()
        }
        return org
    }
}
