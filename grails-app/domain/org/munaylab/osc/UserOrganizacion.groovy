package org.munaylab.osc

import org.munaylab.user.User
import org.munaylab.user.TipoUsuario

class UserOrganizacion {

    User user
    TipoUsuario tipo
    String cargo

    static belongTo = [organizacion: Organizacion]

    static constraints = {
        cargo nullable: true
    }

}
