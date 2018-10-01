package org.munaylab

import org.munaylab.osc.Organizacion
import org.munaylab.planificacion.Programa
import org.munaylab.planificacion.ProgramaCommand
import org.munaylab.planificacion.Proyecto
import org.munaylab.planificacion.ProyectoCommand
import org.munaylab.planificacion.Actividad
import org.munaylab.planificacion.ActividadCommand
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
                Programa programa = planificacionService.actualizarPrograma(command, org)
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

    def proyecto(Long id) {
        Organizacion org = organizacionActual
        Proyecto proyecto = planificacionService.getProyecto(id, org)
        render view: 'proyecto', model: [org: org, proyecto: proyecto]
    }

    def guardarProyecto(ProyectoCommand command) {
        Organizacion org = organizacionActual
        def model = [org: org]
        withForm {
            if (command.validate()) {
                Proyecto proyecto = planificacionService.actualizarProyecto(command, org)
                model << [proyecto: proyecto]
                if (!proyecto?.hasErrors()) {
                    model << [success: true]
                    chain action: 'index', model: model
                }
            } else {
                model << [command: command]
            }
        }.invalidToken {
            model << [error: 'error.invalid.token']
        }
        render view: 'proyecto', model: model
    }

    def actividad(Long id) {
        Organizacion org = organizacionActual
        Actividad actividad = planificacionService.getActividad(id, org)
        render view: 'actividad', model: [org: org, actividad: actividad]
    }

    def guardarActividad(ActividadCommand command) {
        Organizacion org = organizacionActual
        def model = [org: org]
        withForm {
            if (command.validate()) {
                Actividad actividad = planificacionService.actualizarActividad(command, org)
                model << [actividad: actividad]
                if (!actividad?.hasErrors()) {
                    model << [success: true]
                    chain action: 'index', model: model
                }
            } else {
                model << [command: command]
            }
        }.invalidToken {
            model << [error: 'error.invalid.token']
        }
        render view: 'actividad', model: model
    }

}
