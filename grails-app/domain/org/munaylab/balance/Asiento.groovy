package org.munaylab.balance

import org.munaylab.osc.Organizacion

class Asiento {

    Double monto
    String detalle
    Date dateCreated
    Boolean enabled = Boolean.TRUE
    Categoria categoria
    Organizacion organizacion

    static constraints = {
        monto min: 0d, max: 999999d
        detalle size: 5..500
    }

    void actualizarDatos(AsientoCommand command) {
        this.monto = command.monto
        this.detalle = command.detalle
    }
}
