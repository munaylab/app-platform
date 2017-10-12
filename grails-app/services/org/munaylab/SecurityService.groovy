package org.munaylab

import org.munaylab.user.User
import org.munaylab.security.Token
import org.munaylab.security.TipoToken
import grails.gorm.transactions.Transactional

@Transactional
class SecurityService {

    Token generarTokenConfirmacion(User user) {
        new Token(user: user, tipo: TipoToken.CONFIRMACION,
            value: UUID.randomUUID()).save()
    }

    @Transactional(readOnly = true)
    Token validarToken(String value, TipoToken tipo) {
        if (!value) return null

        return Token.findByValueAndTipoAndEnabled(value, tipo, true)
    }

}
