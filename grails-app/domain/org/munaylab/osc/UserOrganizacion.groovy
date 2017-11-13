package org.munaylab.osc

import org.munaylab.user.User
import org.munaylab.user.TipoUsuario

class UserOrganizacion {

    User user
    String cargo
    TipoUsuario tipo
    Organizacion organizacion

    static constraints = {
        cargo nullable: true
    }

}
