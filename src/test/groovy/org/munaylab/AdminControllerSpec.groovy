package org.munaylab

import org.munaylab.Builder
import org.munaylab.BalanceService
import org.munaylab.OrganizacionService
import org.munaylab.user.User
import org.munaylab.osc.Organizacion
import org.munaylab.osc.TipoOrganizacion
import org.munaylab.utils.Respuesta

import grails.plugin.springsecurity.SpringSecurityService
import grails.testing.gorm.DataTest
import grails.testing.web.controllers.ControllerUnitTest
import org.grails.web.servlet.mvc.SynchronizerTokensHolder
import spock.lang.Specification

class AdminControllerSpec extends Specification
        implements ControllerUnitTest<AdminController>, DataTest {

    void setupSpec() {
        mockDomains Organizacion, User
    }

    def setup() {
        controller.balanceService = Mock(BalanceService)
        controller.organizacionService = Mock(OrganizacionService)
        controller.planificacionService = Mock(PlanificacionService)
        controller.springSecurityService = Mock(SpringSecurityService)
    }

    void "agregar ingreso válido"() {
        given:
        1 * controller.balanceService.actualizarAsiento(_) >> { return Builder.crearIngreso() }
        1 * controller.springSecurityService.getCurrentUser() >> { null }
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        and:
        generateSessionToken(session, params, '/balance/asiento')
        when:
        controller.asiento(Builder.ingresoCommand)
        then:
        response.status == 302
        flash.chainModel.ingresoGuardado != null
        controller.chainModel.ingresoGuardado != null
    }
    void "agregar ingreso con error al guardar"() {
        given:
        1 * controller.balanceService.actualizarAsiento(_) >> { return null }
        1 * controller.springSecurityService.getCurrentUser() >> { null }
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        and:
        generateSessionToken(session, params, '/balance/asiento')
        when:
        controller.asiento(Builder.ingresoCommand)
        then:
        response.status == 302
        flash.chainModel.error == 'error.al.guardar'
        controller.chainModel.error == 'error.al.guardar'
    }
    void "agregar ingreso inválido"() {
        given:
        def command = Builder.ingresoCommand
        command.monto = null
        command.validate()
        and:
        generateSessionToken(session, params, '/balance/asiento')
        when:
        controller.asiento(command)
        then:
        response.status == 302
        flash.chainModel.ingreso.hasErrors()
        controller.chainModel.ingreso.hasErrors()
    }
    void "agregar ingreso sin token"() {
        when:
        controller.asiento(Builder.ingresoCommand)
        then:
        response.status == 302
        flash.chainModel.error == 'error.invalid.token'
        controller.chainModel.error == 'error.invalid.token'
    }
    void "agregar egreso válido"() {
        given:
        1 * controller.balanceService.actualizarAsiento(_) >> { return Builder.crearEgreso() }
        1 * controller.springSecurityService.getCurrentUser() >> { null }
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        and:
        generateSessionToken(session, params, '/balance/asiento')
        when:
        controller.asiento(Builder.egresoCommand)
        then:
        response.status == 302
        flash.chainModel.egresoGuardado != null
        controller.chainModel.egresoGuardado != null
    }
    void "agregar egreso con error al guardar"() {
        given:
        1 * controller.balanceService.actualizarAsiento(_) >> { return null }
        1 * controller.springSecurityService.getCurrentUser() >> { null }
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        and:
        generateSessionToken(session, params, '/balance/asiento')
        when:
        controller.asiento(Builder.egresoCommand)
        then:
        response.status == 302
        flash.chainModel.error == 'error.al.guardar'
        controller.chainModel.error == 'error.al.guardar'
    }
    void "agregar egreso inválido"() {
        given:
        def command = Builder.egresoCommand
        command.monto = null
        command.validate()
        and:
        generateSessionToken(session, params, '/balance/asiento')
        when:
        controller.asiento(command)
        then:
        response.status == 302
        flash.chainModel.egreso.hasErrors()
        controller.chainModel.egreso.hasErrors()
    }
    void "agregar egreso sin token"() {
        when:
        controller.asiento(Builder.egresoCommand)
        then:
        response.status == 302
        flash.chainModel.error == 'error.invalid.token'
        controller.chainModel.error == 'error.invalid.token'
    }
    void "agregar programa válido"() {
        given:
        Respuesta result = Respuesta.conValor(Builder.crearPrograma(), 'programa.ok')
        1 * controller.planificacionService.getResumen(_) >> { null }
        1 * controller.planificacionService.actualizarPrograma(_,_) >> { result }
        1 * controller.springSecurityService.getCurrentUser() >> { null }
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        and:
        generateSessionToken(session, params, '/admin/planificacion/programa')
        when:
        request.method = 'POST'
        controller.programa(Builder.programaCommand)
        then:
        response.status == 302
        response.redirectedUrl == '/admin/programa'
    }
    void "agregar programa válido sin token"() {
        given:
        Respuesta result = Respuesta.conValor(Builder.crearPrograma(), 'programa.ok')
        1 * controller.planificacionService.getResumen(_) >> { null }
        1 * controller.springSecurityService.getCurrentUser() >> { null }
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        when:
        request.method = 'POST'
        controller.programa(Builder.programaCommand)
        then:
        response.status == 200
        view == '/admin/planificacion'
        model.error == 'error.invalid.token'
    }

    void generateSessionToken(session, params, uri) {
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = uri
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken(uri)
    }
}
