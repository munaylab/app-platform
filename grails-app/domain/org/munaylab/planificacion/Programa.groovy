package org.munaylab.planificacion

import org.munaylab.osc.Organizacion

class Programa {

    String nombre
    String descripcion
    String imagen
    Date dateCreated
    Date dateUpdated

    static belongsTo = [organizacion: Organizacion]

    static hasMany = [proyectos: Proyecto]

    static constraints = {
        nombre size: 5..500
        descripcion size: 5..1000
        imagen nulleable: true
    }

    void actualizarDatos(ProgramaCommand command) {
        this.imagen = command.imagen
        this.nombre = command.nombre
        this.descripcion = command.descripcion
    }

    String toString() {
        "{id: $id, nombre: $nombre, descripcion: $descripcion, imagen $imagen, org: $organizacion}"
    }
}
