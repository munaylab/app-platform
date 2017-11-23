package org.munaylab

import org.munaylab.user.User
import org.munaylab.balance.Asiento
import org.munaylab.balance.AsientoCommand
import org.munaylab.osc.Organizacion

import grails.plugin.springsecurity.SpringSecurityService
import grails.testing.gorm.DataTest
import grails.testing.web.controllers.ControllerUnitTest
import org.grails.web.servlet.mvc.SynchronizerTokensHolder
import spock.lang.Specification

class BalanceControllerSpec extends Specification
        implements ControllerUnitTest<BalanceController>, DataTest {

    void setupSpec() {
        mockDomains Asiento, Organizacion, User
    }

    def setup() {
        controller.balanceService = Mock(BalanceService)
        controller.organizacionService = Mock(OrganizacionService)
        controller.springSecurityService = Mock(SpringSecurityService)
    }

    void "agregar ingreso sin token"() {
        when:
        controller.asiento(Builder.ingresoCommand)
        then:
        response.json.error == 'error.invalid.token'
    }
    void "agregar ingreso correntamente"() {
        given:
        1 * controller.balanceService.actualizarAsiento(_) >> { new Asiento(id: 1) }
        1 * controller.springSecurityService.getCurrentUser() >> { null }
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        and:
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = '/unaurl'
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken('/unaurl')
        when:
        controller.asiento(Builder.ingresoCommand)
        then:
        response.json.ingresoGuardado != null
        response.json.token != null
    }
    void "agregar ingreso con error al guardar"() {
        given:
        1 * controller.balanceService.actualizarAsiento(_) >> { null }
        1 * controller.springSecurityService.getCurrentUser() >> { null }
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        and:
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = '/unaurl'
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken('/unaurl')
        when:
        controller.asiento(Builder.ingresoCommand)
        then:
        response.json.error == 'error.al.guardar'
        response.json.token != null
    }
    void "agregar ingreso con error en validacion"() {
        given:
        def command = Builder.ingresoCommand
        command.monto = null
        command.validate()
        and:
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = '/unaurl'
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken('/unaurl')
        when:
        controller.asiento(command)
        then:
        response.json.ingreso != null
        response.json.token != null
    }

    void "agregar egreso sin token"() {
        when:
        controller.asiento(Builder.egresoCommand)
        then:
        response.json.error == 'error.invalid.token'
    }
    void "agregar egreso correntamente"() {
        given:
        1 * controller.balanceService.actualizarAsiento(_) >> { new Asiento(id: 1) }
        1 * controller.springSecurityService.getCurrentUser() >> { null }
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        and:
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = '/unaurl'
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken('/unaurl')
        when:
        controller.asiento(Builder.egresoCommand)
        then:
        response.json.egresoGuardado != null
        response.json.token != null
    }
    void "agregar egreso con error al guardar"() {
        given:
        1 * controller.balanceService.actualizarAsiento(_) >> { null }
        1 * controller.springSecurityService.getCurrentUser() >> { null }
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        and:
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = '/unaurl'
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken('/unaurl')
        when:
        controller.asiento(Builder.egresoCommand)
        then:
        response.json.error == 'error.al.guardar'
        response.json.token != null
    }
    void "agregar egreso con error en validacion"() {
        given:
        def command = Builder.egresoCommand
        command.monto = null
        command.validate()
        and:
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = '/unaurl'
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken('/unaurl')
        when:
        controller.asiento(command)
        then:
        response.json.egreso != null
        response.json.token != null
    }
}
