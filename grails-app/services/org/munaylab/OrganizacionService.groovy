package org.munaylab

import org.munaylab.contacto.Contacto
import org.munaylab.contacto.ContactoCommand
import org.munaylab.contacto.TipoContacto
import org.munaylab.contenido.Articulo
import org.munaylab.contenido.ArticuloCommand
import org.munaylab.direccion.Domicilio
import org.munaylab.osc.Organizacion
import org.munaylab.osc.OrganizacionCommand
import org.munaylab.osc.EstadoOrganizacion
import org.munaylab.osc.RegistroCommand
import org.munaylab.osc.UserOrganizacion
import org.munaylab.user.User
import org.munaylab.user.UserCommand
import org.munaylab.user.TipoUsuario
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
        UserOrganizacion admin = new UserOrganizacion(user: representante, organizacion: org, tipo: TipoUsuario.ADMINISTRADOR)
        org.addToAdmins(admin)
        org.save()

        if (!org.hasErrors()) {
            log.info "organizacion registrada id = ${org.id}"
            Token token = securityService.generarTokenConfirmacion(representante)
            emailService.enviarRegistroOrg(representante, org, token.codigo)
        } else {
            log.warn "organizacion con errores ${org.errors.allErrors}"
        }
        return org
    }

    String confirmar(ConfirmacionCommand command) {
        if (command.hasErrors()) return null

        def token = securityService.validarToken(command.codigo, command.refId, TipoToken.CONFIRMACION)
        if (!token) return 'error.security.token.invalido'

        Organizacion org = Organizacion.createCriteria().get {
            admins {
                eq 'id', token.user.id
            }
            eq 'estado', EstadoOrganizacion.PENDIENTE
        }
        if (!org) return 'error.org.noexiste'
        org.estado = EstadoOrganizacion.REGISTRADA
        org.save()
        token.user.accountLocked = false
        token.user.password = command.password1
        token.user.save()

        log.info "organizacion confirmada id = ${org.id}"
        emailService.enviarBienvenidaOrg(token.user, org)

        springSecurityService.reauthenticate(token.user.username)
        return null
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

    Organizacion actualizarContactos(Organizacion org, ContactoCommand command) {
        if (!command || !command.validate()) return null

        Contacto contacto = command.id ? Contacto.get(command.id) : null
        if (contacto) {
            org.removeFromContactos(contacto)
            contacto.delete()
            org.contactos.clear()
        } else if (command.id == null) {
            org.addToContactos(new Contacto(command.properties))
            org.save()
        }
        return org
    }

    Organizacion actualizarUsuario(Organizacion org, UserCommand command) {
        if (!command || !command.validate()) return null

        UserOrganizacion userOrg = command.id ? UserOrganizacion.get(command.id) : null
        if (userOrg) {
            if (userOrg.tipo == TipoUsuario.ADMINISTRADOR) {
                org.removeFromAdmins(userOrg)
                org.admins.clear()
            } else {
                org.removeFromMiembros(userOrg)
                org.miembros.clear()
            }
            userOrg.delete()
        } else if (command.id == null) {
            User user = new User(nombre: command.nombre, apellido: command.apellido,
                username: command.username, password: UUID.randomUUID()).save()
            userOrg = new UserOrganizacion(user: user, organizacion: org, tipo: command.tipo)
            if (command.tipo == TipoUsuario.ADMINISTRADOR) {
                org.addToAdmins(userOrg)
            } else {
                org.addToMiembros(userOrg)
            }
            //TODO send email
            org.save()
        }
        return org
    }

    Organizacion actualizarArticulo(Organizacion org, ArticuloCommand command) {
        if (!command || !command.validate()) return null

        Articulo articulo = command.id ? Articulo.get(command.id) : null
        if (articulo) {
            articulo.actualizarDatos(command)
            articulo.save()
            org.refresh()
        } else {
            User autor = User.get(command.autorId)
            articulo = new Articulo(command.properties)
            articulo.autor = autor
            org.addToArticulos(articulo)
            org.save()
        }

        return org
    }

    Organizacion eliminarArticulo(Organizacion org, ArticuloCommand command) {
        if (!command) return null

        Articulo articulo = command.id ? Articulo.get(command.id) : null
        if (articulo) {
            org.removeFromArticulos(articulo)
            articulo.delete()
            org.articulos.clear()
        }

        return org
    }
}
