package org.munaylab

import org.munaylab.contenido.Articulo
import org.munaylab.contenido.Menu
import org.munaylab.contenido.MenuCommand
import org.munaylab.osc.Organizacion
import org.munaylab.user.User

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_OSC_ADMIN')
class MenuController {

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
        List<Menu> menu = contenidoService.getMenuDeOrganizacion(org)
        render view: 'list', model: [org: org, menu: menu]
    }

    def menu(Long id) {
        Organizacion org = organizacionActual
        Menu menu = id ? contenidoService.obtenerMenu(id, org) : null
        render view: 'show', model: [org: org, menu: menu]
    }

    def actualizar(MenuCommand command) {
        Organizacion org = organizacionActual
        def model = [org: org]
        withForm {
            if (command.validate()) {
                def menu = contenidoService.actualizarMenu(org, command)
                model << [menu: menu]
                if (!menu?.hasErrors()) {
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
