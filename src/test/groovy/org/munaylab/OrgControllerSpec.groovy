package org.munaylab

import org.munaylab.Builder
import org.munaylab.SecurityService
import org.munaylab.OrganizacionService
import org.munaylab.osc.Organizacion
import org.munaylab.osc.UserOrganizacion
import org.munaylab.osc.RegistroCommand
import org.munaylab.user.User
import org.munaylab.utils.EmailService

import grails.plugin.springsecurity.SpringSecurityService
import grails.testing.gorm.DataTest
import grails.testing.web.controllers.ControllerUnitTest
import org.grails.web.servlet.mvc.SynchronizerTokensHolder
import spock.lang.Specification

class OrgControllerSpec extends Specification
        implements ControllerUnitTest<OrgController>, DataTest {

    void setupSpec() {
        mockDomains Organizacion, User
    }

    void setup() {
        controller.emailService = Mock(EmailService)
        controller.securityService = Mock(SecurityService)
        controller.organizacionService = Mock(OrganizacionService)
        controller.springSecurityService = Mock(SpringSecurityService)
    }

    void "ingresar a pagina de org"() {
        given:
        params.nombreURL = 'nombre'
        1 * controller.organizacionService.buscarPorNombre(_) >> { new Organizacion(id: 1) }
        when:
        controller.buscar()
        then:
        model.org != null
        view == '/org/paginadeorg'
        response.status == 200
    }
    void "ingresar a pagina inexistente"() {
        given:
        params.nombreURL = 'nombre'
        1 * controller.organizacionService.buscarPorNombre(_) >> { null }
        when:
        controller.buscar()
        then:
        response.status == 404
    }
    void "registro válido"() {
        given:
        1 * controller.organizacionService.registrar(_) >> {
            def org = Builder.registroCommand.organizacion
            return org.addToAdmins(new UserOrganizacion(user: new User(id: 1)))
        }
        1 * controller.securityService.generarTokenConfirmacion(_) >> {
            [id: 1, codigo: '123456']
        }
        1 * controller.emailService.enviarRegistroOrg(_,_,_) >> { }
        and:
        generateSessionToken(session, params, '/registro')
        when:
        controller.registro(Builder.registroCommand)
        then:
        response.status == 200
        view == '/org/confirmacion'
    }
    void "registro incompleto"() {
        given:
        def command = new RegistroCommand(denominacion: 'Fundación Fake')
        command.validate()
        and:
        generateSessionToken(session, params, '/registro')
        when:
        controller.registro(command)
        then:
        view == '/index'
        model.obj.hasErrors()
    }
    void "registro invalido"() {
        when:
        controller.registro(Builder.registroCommand)
        then:
        model.error == 'error.invalid.token'
    }
    void "confirmacion valida"() {
        given:
        def command = Builder.confirmacionCommand
        and:
        generateSessionToken(session, params, '/registro')
        and:
        1 * controller.securityService.validarToken(_,_,_) >> { return [user: new User()] }
        1 * controller.organizacionService.confirmar(_,_) >> { return new Organizacion() }
        when:
        controller.confirmacion(command)
        then:
        response.status == 302
        view == '/org/confirmacion'
    }
    void "confirmacion invalido"() {
        given:
        def command = Builder.confirmacionCommand
        when:
        controller.confirmacion(command)
        then:
        response.status == 200
        model.error == 'error.invalid.token'
    }

    void generateSessionToken(session, params, uri) {
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = uri
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken(uri)
    }
}
