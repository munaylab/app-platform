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

}
