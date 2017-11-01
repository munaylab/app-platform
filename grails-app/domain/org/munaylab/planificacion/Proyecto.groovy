package org.munaylab.planificacion

class Proyecto {

    String nombre
    String descripcion
    String imagen
    Date dateCreated
    Date dateUpdated
    Boolean publicado = Boolean.FALSE

    static belongsTo = [programa: Programa]

    static hasMany = [actividades: Actividad]

    static constraints = {
        nombre size: 5..500
        descripcion size: 5..1000
        imagen nullable: true
    }

    void actualizarDatos(ProyectoCommand command) {
        this.imagen = command.imagen
        this.nombre = command.nombre
        this.descripcion = command.descripcion
    }
}
