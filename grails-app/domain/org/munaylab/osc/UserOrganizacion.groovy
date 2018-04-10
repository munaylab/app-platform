package org.munaylab.osc

import org.munaylab.user.User
import org.munaylab.categoria.TipoUsuario

class UserOrganizacion {

    User user
    String cargo
    TipoUsuario tipo
    Organizacion organizacion

    static constraints = {
        cargo nullable: true
    }

}
