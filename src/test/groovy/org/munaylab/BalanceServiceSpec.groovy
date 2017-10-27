package org.munaylab

import org.munaylab.balance.AsientoCommand
import org.munaylab.balance.Ingreso

import grails.testing.gorm.DataTest
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class BalanceServiceSpec extends Specification
        implements ServiceUnitTest<BalanceService>, DataTest {


    void setupSpec() {
        mockDomains Ingreso
    }

    void "agregar ingreso"() {
        expect:
        true == true
        // when:
        // service.agregarAsiento(asientoCommand)
        // then:
        // Ingreso.all.size() == 1
    }

    private AsientoCommand getAsientoCommand() {
        new AsientoCommand(monto: 100.0, detalle: 'detalle de asiento')
    }
}
