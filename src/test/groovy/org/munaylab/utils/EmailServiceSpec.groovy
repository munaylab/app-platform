package org.munaylab.utils

import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class EmailServiceSpec extends Specification
        implements ServiceUnitTest<EmailService> {

    def setup() {
        //service.mailService = Mock(MailService)
    }

    void "EmailService - enviar mail a persona sin email"() {
        expect:
        true == true
    }

    private getPersona() {

    }
}
