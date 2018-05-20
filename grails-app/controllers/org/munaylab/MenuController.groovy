package org.munaylab

import org.munaylab.contenido.Articulo
import org.munaylab.contenido.Cabecera
import org.munaylab.contenido.CabeceraCommand
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
        List<Cabecera> cabeceras = contenidoService.getCabecerasDeOrganizacion(org)
        render view: 'list', model: [org: org, cabeceras: cabeceras]
    }

    def cabecera(Long id) {
        Organizacion org = organizacionActual
        Cabecera cabecera = id ? contenidoService.obtenerCabecera(id, org) : null
        render view: 'show', model: [org: org, cabecera: cabecera]
    }

    def actualizar(CabeceraCommand command) {
        Organizacion org = organizacionActual
        def model = [org: org]
        withForm {
            if (command.validate()) {
                def cabecera = contenidoService.actualizarCabecera(org, command)
                model << [cabecera: cabecera]
                if (!cabecera?.hasErrors()) {
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
