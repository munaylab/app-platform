package org.munaylab.planificacion

class ProyectoCommand implements grails.validation.Validateable {

    Long id
    Long programaId
    String nombre
    String descripcion
    String imagen

    static constraints = {
        id nullable: true
        nombre size: 5..500
        descripcion size: 5..1000
        imagen nullable: true
    }

}