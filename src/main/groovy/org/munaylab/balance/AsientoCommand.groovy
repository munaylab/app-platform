package org.munaylab.balance

class AsientoCommand {

    Double monto
    String detalle
    Programable programable
    Integer idCategoria
    Integer idSubCategoria
    String nombreCategoria
    Boolean esIngreso

    Egreso getEgreso() {
        new Egreso(monto: monto, detalle: detalle)
    }

    Ingreso getIngreso() {
        new Ingreso(monto: monto, detalle: detalle, programable: programable)
    }

}
