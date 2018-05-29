package org.munaylab

import org.munaylab.osc.Organizacion
import org.munaylab.planificacion.Programa
import org.munaylab.planificacion.ProgramaCommand
import org.munaylab.user.User

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_OSC_ADMIN')
class PlanificacionController {

    def organizacionService
    def planificacionService
    def springSecurityService

    private Organizacion getOrganizacionActual() {
        User user = springSecurityService.currentUser
        organizacionService.getOrganizacionActualDe(user)
    }

    def index() {
        Organizacion org = organizacionActual
        List<Programa> programas = planificacionService.getProgramas(org)
        render view: 'index', model: [org: org, programas: programas]
    }

    def programa(Long id) {
        Organizacion org = organizacionActual
        Programa programa = planificacionService.getPrograma(id, org)
        render view: 'programa', model: [org: org, programa: programa]
    }

    def guardarPrograma(ProgramaCommand command) {
        Organizacion org = organizacionActual
        def model = [org: org]
        withForm {
            if (command.validate()) {
                def programa = planificacionService.actualizarPrograma(command, org)
                model << [programa: programa]
                if (!programa?.hasErrors()) {
                    model << [success: true]
                    chain action: 'index', model: model
                }
            } else {
                model << [command: command]
            }
        }.invalidToken {
            model << [error: 'error.invalid.token']
        }
        render view: 'programa', model: model
    }

}
