package org.munaylab.balance

class Asiento {

    Double monto
    String detalle
    Date dateCreated
    Boolean enabled
    Categoria categoria

    static constraints = {
        // monto min: 0.0
        detalle blank: false
    }
}
