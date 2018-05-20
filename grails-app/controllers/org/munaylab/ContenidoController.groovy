package org.munaylab

import org.munaylab.contenido.Articulo
import org.munaylab.contenido.ArticuloCommand
import org.munaylab.osc.Organizacion
import org.munaylab.user.User

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_OSC_ADMIN')
class ContenidoController {

    def contenidoService
    def organizacionService
    def springSecurityService

    static defaultAction = 'list'

    private Organizacion getOrganizacionActual() {
        User user = springSecurityService.currentUser
        organizacionService.getOrganizacionActualDe(user)
    }

    def list() {
        Organizacion org = organizacionActual
        List<Articulo> articulos = contenidoService.obtenerTodosLosArticulos(org)
        render view: 'list', model: [org: org, articulos: articulos]
    }

    def articulo(Long id) {
        Organizacion org = organizacionActual
        Articulo articulo = id ? contenidoService.obtenerArticulo(id, org) : null
        render view: 'show', model: [org: org, articulo: articulo]
    }

    def actualizar(ArticuloCommand command) {
        Organizacion org = organizacionActual
        def model = [org: org]
        withForm {
            if (command.validate()) {
                def articulo = contenidoService.actualizarArticulo(command, org)
                model << [articulo: articulo]
                if (!articulo?.hasErrors()) {
                    model << [success: true]
                    chain action: 'list', model: model
                }
            } else {
                model << [command: command]
            }
        }.invalidToken {
            model << [error: 'error.invalid.token']
        }
        render view: 'show', model: model
    }

}
