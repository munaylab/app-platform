package org.munaylab.direccion

class Domicilio {

    String calle
    String numero
    String barrio
    String distrito
    String localidad
    String provincia

    static constraints = {
        calle size: 3..20
        numero size: 1..5
        barrio size: 3..20
        distrito size: 3..20
        localidad size: 3..20
        provincia size: 3..20
    }

}
