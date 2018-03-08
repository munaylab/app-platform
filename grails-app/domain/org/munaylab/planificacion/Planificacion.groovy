package org.munaylab.planificacion

import org.munaylab.osc.Organizacion

class Planificacion {

    String nombre
    String descripcion
    String imagen
    Date dateCreated
    Date lastUpdated
    Boolean publicado = Boolean.FALSE

    static belongsTo = [organizacion: Organizacion]

    static constraints = {
        nombre size: 5..500
        descripcion size: 5..1000
        imagen nullable: true
    }

    void actualizarDatos(PlanificacionCommand command) {
        this.imagen = command.imagen
        this.nombre = command.nombre
        this.descripcion = command.descripcion
    }

}
