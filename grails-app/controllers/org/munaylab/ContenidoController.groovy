package org.munaylab

import org.munaylab.contenido.Articulo
import org.munaylab.contenido.ArticuloCommand
import org.munaylab.contenido.Landing
import org.munaylab.contenido.LandingCommand
import org.munaylab.contenido.Menu
import org.munaylab.contenido.MenuCommand
import org.munaylab.osc.Organizacion
import org.munaylab.user.User

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_OSC_ADMIN')
class ContenidoController {

    def contenidoService
    def organizacionService
    def springSecurityService

    private Organizacion getOrganizacionActual() {
        User user = springSecurityService.currentUser
        organizacionService.getOrganizacionActualDe(user)
    }

    def index() {
        Organizacion org = organizacionActual
        Landing landing = contenidoService.getLanding(org)
        List<Menu> menu = contenidoService.getMenuDeOrganizacion(org)
        List<Articulo> articulos = contenidoService.obtenerTodosLosArticulos(org)
        def model = [org: org, landing: landing, menu: menu, articulos: articulos]
        render view: 'index', model: model
    }

    def articulo(Long id) {
        Organizacion org = organizacionActual
        Articulo articulo = id ? contenidoService.obtenerArticulo(id, org) : null
        render view: 'articulo', model: [org: org, articulo: articulo]
    }

    def guardarArticulo(ArticuloCommand command) {
        Organizacion org = organizacionActual
        def model = [org: org]
        withForm {
            if (command.validate()) {
                def articulo = contenidoService.actualizarArticulo(command, org)
                model << [articulo: articulo]
                if (!articulo?.hasErrors()) {
                    model << [success: true]
                    chain action: 'index', model: model
                }
            } else {
                model << [command: command]
            }
        }.invalidToken {
            model << [error: 'error.invalid.token']
        }
        render view: 'articulo', model: model
    }

    def landing(Long id) {
        Organizacion org = organizacionActual
        Landing landing = contenidoService.getLanding(org)
        render view: 'landing', model: [org: org, landing: landing]
    }

    def guardarLanding(LandingCommand command) {
        Organizacion org = organizacionActual
        def model = [org: org]
        withForm {
            if (command.validate()) {
                def landing = contenidoService.actualizarLanding(command, org)
                model << [landing: landing]
                if (!landing?.hasErrors()) {
                    model << [success: true]
                    chain action: 'index', model: model
                }
            } else {
                model << [command: command]
            }
        }.invalidToken {
            model << [error: 'error.invalid.token']
        }
        render view: 'landing', model: model
    }

    def menu(Long id) {
        Organizacion org = organizacionActual
        Menu menu = id ? contenidoService.obtenerMenu(id, org) : null
        render view: 'menu', model: [org: org, menu: menu]
    }

    def guardarMenu(MenuCommand command) {
        Organizacion org = organizacionActual
        def model = [org: org]
        withForm {
            if (command.validate()) {
                def menu = contenidoService.actualizarMenu(org, command)
                model << [menu: menu]
                if (!menu?.hasErrors()) {
                    model << [success: true]
                    chain action: 'index', model: model
                }
            } else {
                model << [command: command]
            }
        }.invalidToken {
            model << [error: 'error.invalid.token']
        }
        render view: 'menu', model: model
    }

}
