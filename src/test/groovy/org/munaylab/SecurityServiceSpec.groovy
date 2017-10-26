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

    void '[SecurityService] - generar token'() {
        when: 'generamos un token de confirmacion'
        def token = service.generarTokenConfirmacion(user)
        then: 'el token de confirmacion queda guardado'
        token && Token.countByTipo(TipoToken.CONFIRMACION) == 1
    }

    void '[SecurityService] - validar token'() {
        when: 'validamos un token'
        def t = service.validarToken(token.value, TipoToken.CONFIRMACION)
        then: 'comprobamos que el token es valido'
        t && Token.count() == 1
    }

    void '[SecurityService] - token invalido'() {
        when: 'tratamos de validar un token'
        def t = service.validarToken('invalido', TipoToken.CONFIRMACION)
        then: 'comprobamos que el token es invalido'
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
