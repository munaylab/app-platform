package org.munaylab

import org.munaylab.user.User
import org.munaylab.security.Token
import org.munaylab.security.TipoToken

import grails.testing.gorm.DataTest
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class SecurityServiceSpec extends Specification
        implements ServiceUnitTest<SecurityService>, DataTest {

    void setupSpec() {
        mockDomains User, Token
    }

    void "generar token"() {
        when:
        def token = service.generarTokenConfirmacion(user)
        then:
        token && Token.count() == 1
    }

    void "validar token"() {
        when:
        def t = service.validarToken(token.value, TipoToken.CONFIRMACION)
        then:
        t && Token.count() == 1
    }

    void "token invalido"() {
        when:
        def t = service.validarToken('invalido', TipoToken.CONFIRMACION)
        then:
        !t && Token.count() == 0
    }

    private User getUser() {
        new User(username: 'mcaligares@gmail.com', nombre: 'Augusto',
            apellido: 'Caligares', password: 'password').save(flush: true)
    }
    private Token getToken() {
        new Token(user: user, tipo: TipoToken.CONFIRMACION,
            value: 'TOKEN').save(flush: true)
    }
}
