package org.munaylab.planificacion

class Proyecto {

    String nombre
    String descripcion
    String imagen
    Date dateCreated
    Date dateUpdated

    static belongsTo = [programa: Programa]

    static hasMany = [actividades: Actividad]

    static constraints = {
        nombre size: 5..500
        descripcion size: 5..1000
        imagen nulleable: true
    }
}
