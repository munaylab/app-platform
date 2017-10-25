package org.munaylab.planificacion

class ActividadCommand implements grails.validation.Validateable {

    Long id
    Long proyectoId
    String nombre
    String descripcion
    String imagen

    static constraints = {
        id nullable: true
        nombre size: 5..500
        descripcion size: 5..1000
        imagen nulleable: true
    }

}
