package org.munaylab

import org.munaylab.contacto.Contacto
import org.munaylab.contacto.TipoContacto
import org.munaylab.direccion.Domicilio
import org.munaylab.direccion.DomicilioCommand
import org.munaylab.osc.Organizacion
import org.munaylab.osc.OrganizacionCommand
import org.munaylab.osc.RegistroCommand
import org.munaylab.osc.EstadoOrganizacion
import org.munaylab.osc.TipoOrganizacion
import org.munaylab.user.User
import org.munaylab.utils.EmailService
import org.munaylab.security.ConfirmacionCommand
import org.munaylab.security.Token

import grails.plugin.springsecurity.SpringSecurityService
import grails.testing.gorm.DataTest
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class OrganizacionServiceSpec extends Specification
        implements ServiceUnitTest<OrganizacionService>, DataTest {

    void setupSpec() {
        mockDomains Organizacion, User, Token
    }

    def setup() {
        service.emailService = Mock(EmailService)
        service.securityService = Mock(SecurityService)
        service.springSecurityService = Mock(SpringSecurityService)
        service.securityService.generarTokenConfirmacion(_) >> { [value: ''] }
    }

    void "[OrganizacionService] - registro incompleto"() {
        given:
        def registroCommand = Builder.registroCommand
        registroCommand.email = null
        registroCommand.telefono = null
        when:
        def org = service.registrar(registroCommand)
        then:
        registroCommand.validate() == false
        org == null && Organizacion.all.size() == 0
    }
    void "[OrganizacionService] - registro completo"() {
        given:
        def registroCommand = Builder.registroCommand
        1 * service.emailService.enviarRegistroOrg(_,_,_)
        when:
        def org = service.registrar(registroCommand)
        then:
        registroCommand.validate() == true
        User.all.size() == 1
        Organizacion.get(1).admins.size() == 1
        org != null && Organizacion.all.size() == 1
    }
    void "[OrganizacionService] - registrar una organizacion ya existente"() {
        given:
        def registroCommand = Builder.registroCommand
        registroCommand.organizacion.save(flush: true)
        when:
        def org = service.registrar(registroCommand)
        then:
        registroCommand.validate() == true
        org != null && org.hasErrors()
    }
    void "[OrganizacionService] - confirmar un registro"() {
        given:
        service.securityService.validarToken(_,_) >> {
            new Token(user: User.get(1))
        }
        service.registrar(Builder.registroCommand)
        1 * service.springSecurityService.reauthenticate(_)
        when:
        service.confirmar(Builder.confirmacionCommand)
        then:
        Organizacion.countByEstado(EstadoOrganizacion.REGISTRADA) == 1
    }
    void "[OrganizacionService] - confirmar un registro invalido"() {
        given:
        service.registrar(Builder.registroCommand)
        and:
        1 * service.securityService.validarToken(_,_) >> {
            return null
        }
        when:
        def org = service.confirmar(Builder.confirmacionCommand)
        then:
        org == null
        Organizacion.get(1).estado == EstadoOrganizacion.PENDIENTE
    }
    void "[OrganizacionService] - datos de confirmacion validos"() {
        given:
        service.registrar(Builder.registroCommand)
        and:
        1 * service.securityService.validarToken(_,_) >> {
            new Token(user: User.get(1))
        }
        when:
        def (token, user, org) = service.datosConfirmacion('CONFIRMCODE')
        then:
        token != null && user != null && org != null
    }
    void "[OrganizacionService] - datos de confirmacion invalidos"() {
        given:
        1 * service.securityService.validarToken(_,_) >> { null }
        when:
        def (token, user, org) = service.datosConfirmacion('CONFIRMCODE')
        then:
        token == null && user == null && org == null
    }
    void "[OrganizacionService] - listar organizaciones pendientes"() {
        given:
        def registroCommand = Builder.registroCommand
        registroCommand.organizacion.save(flush: true)
        expect:
        service.organizacionesPendientes.size() == 1
    }
    void "[OrganizacionService] - listar organizaciones registradas"() {
        given:
        def org = Builder.registroCommand.organizacion //TODO command method
        org.estado = EstadoOrganizacion.REGISTRADA
        org.save(flush: true)
        expect:
        service.organizacionesRegistradas.size() == 1
    }
    void "[OrganizacionService] - guardar datos"() {
        given:
        def datos = Builder.DATOS_ORG
        def org = Builder.crearOrganizacionConDatos(datos).save(flush: true)
        when:
        def orgActualizada = service.guardar(Builder.organizacionCommand)
        then:
        comprobarDatosActualizados(orgActualizada, datos)
    }
    void "[OrganizacionService] - guardar direccion"() {
        given:
        def org = Builder.crearOrganizacionConDatos(Builder.DATOS_ORG)
        org.domicilio = Builder.crearDomicilioConDatos(Builder.DATOS_DOMICILIO)
        org.save(flush: true)
        when:
        def orgActualizada = service.guardar(Builder.organizacionConDomicilioCommand)
        then:
        comprobarDatosActualizados(orgActualizada, Builder.DATOS_ORG)
        comprobarDomicilioActualizado(orgActualizada.domicilio, Builder.DATOS_DOMICILIO)
    }

    void comprobarDatosActualizados(org, datos) {
        assert org.tipo != datos.tipo
        assert org.nombre != datos.nombre
        assert org.objeto != datos.objeto
        assert org.fechaConstitucion != datos.fechaConstitucion
    }
    void comprobarDomicilioActualizado(domicilio, datos) {
        assert domicilio.calle != datos.calle
        assert domicilio.numero != datos.numero
        assert domicilio.barrio != datos.barrio
        assert domicilio.localidad != datos.localidad
        assert domicilio.provincia != datos.provincia
    }

    void "[OrganizacionService] - agregar contacto"() {
        given:
        def command = Builder.contactoCommand
        def org = Builder.crearOrganizacionConDatos().save(flush: true)
        when:
        org = service.agregarContacto(org, command)
        then:
        org.contactos.size() == 1
        Contacto.all.size() == 1
    }
    void "[OrganizacionService] - agregar contacto"() {
        given:
        def org = Builder.crearOrganizacionConDatos()
        org.addToContactos(Builder.crearContacto()).save(flush: true)
        def command = Builder.contactoCommand
        and:
        command.id = 1
        when:
        org = service.agregarContacto(org, command)
        then:
        Contacto.all.size() == 0
        org.contactos.size() == 0
        Organizacion.get(1).contactos.size() == 0
    }
}
