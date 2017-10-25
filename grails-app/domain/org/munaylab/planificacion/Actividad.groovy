package org.munaylab.planificacion

class Actividad {

    String nombre
    String descripcion
    String imagen
    Date dateCreated
    Date dateUpdated

    static belongsTo = [proyecto: Proyecto]

    static constraints = {
        nombre size: 5..500
        descripcion size: 5..1000
        imagen nullable: true
    }

    void actualizarDatos(ActividadCommand command) {
        this.imagen = command.imagen
        this.nombre = command.nombre
        this.descripcion = command.descripcion
    }

}
