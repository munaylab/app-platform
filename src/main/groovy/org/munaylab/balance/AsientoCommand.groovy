package org.munaylab.balance

class AsientoCommand implements grails.validation.Validateable {

    Long id
    Double monto
    String detalle
    Programable programable
    Boolean esIngreso
    CategoriaCommand categoria

    static constraints = {
        id nullable: true
        monto min: 0d, max: 999999d
        detalle size: 5..500
        programable nullable: true
    }
}
