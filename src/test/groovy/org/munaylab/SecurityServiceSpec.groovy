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

    void "[SecurityService] - generar token"() {
        when:
        def token = service.generarTokenConfirmacion(user)
        then:
        token && Token.count() == 1
    }
    void "[SecurityService] - validar token"() {
        given:
        def t = token
        when:
        t = service.validarToken(t.value, t.user.id, TipoToken.CONFIRMACION)
        then:
        t && Token.count() == 1
    }
    void "[SecurityService] - token invalido"() {
        when:
        def t = service.validarToken('invalido', 1, TipoToken.CONFIRMACION)
        then:
        !t && Token.count() == 0
    }
    void '[SecurityService] - consultar por token'() {
        given:
        token
        expect:
        service.tokenValido(value, refId, tipo) == result
        where:
        value   | refId | tipo                   | result
        ''      | 1     | TipoToken.CONFIRMACION | false
        'TOKEN' | 2     | TipoToken.CONFIRMACION | false
        'TOKE'  | 1     | TipoToken.CONFIRMACION | false
        'T'     | 1     | TipoToken.CONFIRMACION | false
        'TOKEN' | 1     | TipoToken.CONFIRMACION | true
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
