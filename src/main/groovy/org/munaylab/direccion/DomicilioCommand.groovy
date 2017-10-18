package org.munaylab.direccion

class DomicilioCommand implements grails.validation.Validateable {

    Long id
    String calle
    String numero
    String barrio
    String distrito
    String localidad
    String provincia

    static constraints = {
        id nullable: true
        calle size: 3..20
        numero size: 1..5
        barrio size: 3..20
        distrito nullable: true, size: 3..20
        localidad size: 3..20
        provincia size: 3..20
    }

}
