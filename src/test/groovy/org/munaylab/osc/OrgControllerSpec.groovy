package org.munaylab.osc

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

    void "OrgController - registro"() {
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
        response.text == "org register ok"
    }
    void "OrgController - registro incompleto"() {
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
        view == '/organizaciones'
        model.obj.hasErrors()
    }
    void "OrgController - registro invalido"() {
        when:
        controller.registro(registroTemplate)
        then:
        model.error == 'error.invalid.token'
    }
    void "OrgController - confirmacion valida"() {
        given:
        1 * controller.organizacionService.datosConfirmacion(_) >> {
            return [true, null, null]
        }
        when:
        controller.confirmacion('codigo')
        then:
        response.status == 200

        model.codigo == 'codigo'
    }
    void "OrgController - confirmacion invalido"() {
        given:
        1 * controller.organizacionService.datosConfirmacion(_) >> {
            return [null, null, null]
        }
        when:
        controller.confirmacion('codigo')
        then:
        response.status == 404
    }

    private RegistroCommand getRegistroTemplate() {
        new RegistroCommand(denominacion: 'Fundación MunayLab', tipo: TipoOrganizacion.FUNDACION,
            objeto: 'brindar soluciones a todas las organizaciones sociales',
            nombre: 'Augusto', apellido: 'caligares', email: 'mcaligares@gmail.com', telefono: '1234567')
    }
}
