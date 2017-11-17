package org.munaylab.direccion

class Domicilio {

    String calle
    String numero
    String barrio
    String distrito
    String localidad
    String provincia
    String latitudPos
    String longitudPos
    //TODO departamento piso pais

    static constraints = {
        calle size: 3..20 //50
        numero size: 1..5
        barrio size: 3..20 //50
        distrito nullable: true, size: 3..20 //50
        localidad size: 3..20
        provincia size: 3..20
        latitudPos nullable: true
        longitudPos nullable: true
    }

    void actualizarDatos(DomicilioCommand command) {
        if (!command || id != command.id) return

        this.calle = command.calle
        this.numero = command.numero
        this.barrio = command.barrio
        this.distrito = command.distrito
        this.localidad = command.localidad
        this.provincia = command.provincia
    }

}
