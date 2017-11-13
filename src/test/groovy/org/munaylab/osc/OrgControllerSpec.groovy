package org.munaylab.osc

import org.munaylab.Builder
import org.munaylab.OrganizacionService
import org.munaylab.user.User
import org.munaylab.osc.RegistroCommand
import org.munaylab.osc.Organizacion

import grails.testing.gorm.DataTest
import grails.testing.web.controllers.ControllerUnitTest
import org.grails.web.servlet.mvc.SynchronizerTokensHolder
import spock.lang.Specification

class OrgControllerSpec extends Specification
        implements ControllerUnitTest<OrgController>, DataTest {

    void setupSpec() {
        mockDomains Organizacion, User
    }

    def setup() {
        controller.organizacionService = Mock(OrganizacionService)
    }

    void "registro"() {
        given:
        1 * controller.organizacionService.registrar(_) >> {
            return registroTemplate.organizacion
        }
        and:
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = '/registro'
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken('/registro')
        when:
        controller.registro(registroTemplate)
        then:
        model.from == 'confirmacion' && model.org != null
        view == '/landing/organizaciones'
    }
    void "registro incompleto"() {
        given:
        def command = new RegistroCommand(denominacion: 'Fundación Fake')
        command.validate()
        and:
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = '/registro'
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken('/registro')
        when:
        controller.registro(command)
        then:
        view == '/landing/organizaciones'
        model.obj.hasErrors()
    }
    void "registro invalido"() {
        when:
        controller.registro(registroTemplate)
        then:
        model.error == 'error.invalid.token'
    }
    void "confirmacion valida"() {
        given:
        def command = Builder.confirmacionCommand
        and:
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = '/registro'
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken('/registro')
        when:
        controller.confirmacion(command)
        then:
        response.status == 302
        view == '/landing/organizaciones'
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

    private RegistroCommand getRegistroTemplate() {
        new RegistroCommand(denominacion: 'Fundación MunayLab', tipo: TipoOrganizacion.FUNDACION,
            objeto: 'brindar soluciones a todas las organizaciones sociales',
            nombre: 'Augusto', apellido: 'caligares', email: 'mcaligares@gmail.com', telefono: '1234567')
    }
}
