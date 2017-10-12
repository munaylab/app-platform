package org.munaylab

import org.munaylab.contacto.Contacto
import org.munaylab.contacto.TipoContacto
import org.munaylab.osc.Organizacion
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

    void "OrganizacionService - registro incompleto"() {
        given:
        def registroCommand = registroTemplate
        registroCommand.email = null
        registroCommand.telefono = null
        when:
        def org = service.registrar(registroCommand)
        then:
        registroCommand.validate() == false
        org == null && Organizacion.all.size() == 0
    }
    void "OrganizacionService - registro completo"() {
        given:
        def registroCommand = registroTemplate
        1 * service.emailService.enviarRegistroOrg(_,_,_)
        when:
        def org = service.registrar(registroCommand)
        then:
        registroCommand.validate() == true
        User.all.size() == 1
        Organizacion.get(1).admins.size() == 1
        org != null && Organizacion.all.size() == 1
    }
    void "OrganizacionService - registrar una organizacion ya existente"() {
        given:
        def registroCommand = registroTemplate
        registroCommand.organizacion.save(flush: true)
        when:
        def org = service.registrar(registroCommand)
        then:
        registroCommand.validate() == true
        org != null && org.hasErrors()
    }
    void "OrganizacionService - confirmar un registro"() {
        given:
        service.securityService.validarToken(_,_) >> {
            new Token(user: User.get(1))
        }
        service.registrar(registroTemplate)
        1 * service.springSecurityService.reauthenticate(_)
        when:
        service.confirmar(confirmacionCommand)
        then:
        Organizacion.countByEstado(EstadoOrganizacion.REGISTRADA) == 1
    }
    void "OrganizacionService - confirmar un registro invalido"() {
        given:
        service.registrar(registroTemplate)
        and:
        1 * service.securityService.validarToken(_,_) >> {
            return null
        }
        when:
        def org = service.confirmar(confirmacionCommand)
        then:
        org == null
        Organizacion.get(1).estado == EstadoOrganizacion.PENDIENTE
    }
    void "OrganizacionService - datos de confirmacion validos"() {
        given:
        service.registrar(registroTemplate)
        and:
        1 * service.securityService.validarToken(_,_) >> {
            new Token(user: User.get(1))
        }
        when:
        def (token, user, org) = service.datosConfirmacion('CONFIRMCODE')
        then:
        token != null && user != null && org != null
    }
    void "OrganizacionService - datos de confirmacion invalidos"() {
        given:
        1 * service.securityService.validarToken(_,_) >> { null }
        when:
        def (token, user, org) = service.datosConfirmacion('CONFIRMCODE')
        then:
        token == null && user == null && org == null
    }
    void "OrganizacionService - listar organizaciones pendientes"() {
        given:
        def registroCommand = registroTemplate
        registroCommand.organizacion.save(flush: true)
        expect:
        service.organizacionesPendientes.size() == 1
    }
    void "OrganizacionService - listar organizaciones registradas"() {
        given:
        def org = registroTemplate.organizacion
        org.estado = EstadoOrganizacion.REGISTRADA
        org.save(flush: true)
        expect:
        service.organizacionesRegistradas.size() == 1
    }

    private RegistroCommand getRegistroTemplate() {
        new RegistroCommand(denominacion: 'Fundación MunayLab', tipo: TipoOrganizacion.FUNDACION,
            objeto: 'brindar soluciones a todas las organizaciones sociales',
            nombre: 'Augusto', apellido: 'caligares', email: 'mcaligares@gmail.com', telefono: '1234567')
    }
    private ConfirmacionCommand getConfirmacionCommand() {
        new ConfirmacionCommand(codigo: 'codigo', password1: 'asdQWE123', password2: 'asdQWE123')
    }
}
