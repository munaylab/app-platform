package org.munaylab.security

import org.munaylab.user.User

class Token {

    User user
    String value
    TipoToken tipo
    Date dateCreated
    Boolean enabled = Boolean.TRUE

    static constraints = {
    }
}
