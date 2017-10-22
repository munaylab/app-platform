package org.munaylab.contenido

class ArticuloCommand implements grails.validation.Validateable {

    Long id
    Long autorId
    String titulo
    String contenido
    String imagen
    TipoArticulo tipo

    static constraints = {
        id nullable: true
        titulo size: 5..100
        contenido size: 10..5000
        imagen nullable: true
    }

}
