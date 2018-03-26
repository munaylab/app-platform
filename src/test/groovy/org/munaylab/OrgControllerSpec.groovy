package org.munaylab

import org.munaylab.Builder
import org.munaylab.OrganizacionService
import org.munaylab.user.User
import org.munaylab.osc.Organizacion

import grails.testing.gorm.DataTest
import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class OrgControllerSpec extends Specification
        implements ControllerUnitTest<OrgController> {

    void setup() {
        controller.organizacionService = Mock(OrganizacionService)
    }

    void "ingresar a pagina de org"() {
        given:
        params.nombreURL = 'nombre'
        1 * controller.organizacionService.buscarPorNombre(_) >> { new Organizacion(id: 1) }
        when:
        controller.index()
        then:
        model.org != null
        view == '/org/index'
        response.status == 200
    }

    void "ingresar a pagina inexistente"() {
        given:
        params.nombreURL = 'nombre'
        1 * controller.organizacionService.buscarPorNombre(_) >> { null }
        when:
        controller.index()
        then:
        response.status == 404
    }
}
