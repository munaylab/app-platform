package org.munaylab.contenido

import org.munaylab.user.User
import org.munaylab.osc.Organizacion

class Articulo {

    User autor
    String titulo
    String contenido
    String imagen
    TipoArticulo tipo
    Boolean publicado = Boolean.TRUE
    Date dateCreated
    Date lastUpdated

    static belongsTo = [organizacion: Organizacion]

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
