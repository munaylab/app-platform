package org.munaylab

import org.munaylab.contenido.Landing
import org.munaylab.contenido.LandingCommand
import org.munaylab.osc.Organizacion
import org.munaylab.user.User

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_OSC_ADMIN')
class LandingController {

    def contenidoService
    def organizacionService
    def springSecurityService

    private Organizacion getOrganizacionActual() {
        User user = springSecurityService.currentUser
        organizacionService.getOrganizacionActualDe(user)
    }

    def index(Long id) {
        Organizacion org = organizacionActual
        Landing landing = contenidoService.getLanding(org)
        render view: 'index', model: [org: org, landing: landing]
    }

    def actualizar(LandingCommand command) {
        Organizacion org = organizacionActual
        def model = [org: org]
        withForm {
            if (command.validate()) {
                def landing = contenidoService.actualizarLanding(command, org)
                model << [landing: landing]
                if (!landing?.hasErrors()) {
                    model << [success: true]
                    chain view: 'index', model: model
                }
            } else {
                model << [command: command]
            }
        }.invalidToken {
            model << [error: 'error.invalid.token']
        }
        render view: 'index', model: model
    }

}
