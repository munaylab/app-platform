package org.munaylab.contenido

import org.munaylab.user.User

class Articulo {

    User autor
    String titulo
    String contenido
    String imagen
    TipoArticulo tipo
    Boolean enabled = Boolean.TRUE
    Date dateCreated
    Date lastUpdated

    static constraints = {
        titulo size: 5..100
        contenido size: 10..5000
        imagen nullable: true
    }

    void actualizarDatos(ArticuloCommand command) {
        this.imagen = command.imagen
        this.titulo = command.titulo
        this.contenido = command.contenido
    }

}
