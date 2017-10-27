package org.munaylab.balance

class Ingreso extends Asiento {

    Programable programable

    static constraints = {
        programable nullable: true
    }

}
