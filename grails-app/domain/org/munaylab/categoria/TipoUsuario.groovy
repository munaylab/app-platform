package org.munaylab.categoria

import org.munaylab.osc.Organizacion

class TipoUsuario {

    String nombre
    Organizacion organizacion

    static constraints = {
        nombre nulleable: false
        organizacion nulleable: true
    }

}
