package org.munaylab.gamification

class HistorialPuntaje {

    String evento
    Integer puntos
    Date dateCreated
    Date lastUpdated

    static belongsTo = [puntaje: Puntaje]

    static constraints = {
        evento blank: false, size: 3..50
        puntos nullable: false, min: 0, max: 101
    }

}
