package org.munaylab.balance

import org.munaylab.osc.Organizacion

class Asiento {

    Date fecha
    Double monto
    String detalle
    Date dateCreated
    Boolean enabled = Boolean.TRUE
    TipoAsiento tipo
    Categoria categoria
    Programable programable
    Organizacion organizacion

    static constraints = {
        monto min: 0d, max: 999999d
        detalle size: 5..500
        programable nullable: true
    }

    void actualizarDatos(AsientoCommand command) {
        this.fecha = command.fecha
        this.monto = command.monto
        this.detalle = command.detalle
        this.tipo = command.esIngreso ? TipoAsiento.INGRESO : TipoAsiento.EGRESO
    }
}
