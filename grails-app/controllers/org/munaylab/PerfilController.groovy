package org.munaylab

import org.munaylab.user.User
import org.munaylab.osc.Organizacion
import org.munaylab.osc.OrganizacionCommand

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_OSC_ADMIN')
class PerfilController {

    def organizacionService
    def springSecurityService

    private Organizacion getOrganizacionActual() {
        User user = springSecurityService.currentUser
        organizacionService.getOrganizacionActualDe(user)
    }

    def index() {
        Organizacion org = organizacionActual
        render view: 'index', model: [org: org]
    }

    def guardar(OrganizacionCommand command) {
        Organizacion org = organizacionActual
        def model = [org: org]
        withForm {
            if (command.validate()) {
                org = organizacionService.guardar(command)
                model << [org: org]
                if (!org?.hasErrors()) {
                    model << [success: true]
                    chain action: 'index', model: model
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
