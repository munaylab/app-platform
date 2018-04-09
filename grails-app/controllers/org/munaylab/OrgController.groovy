package org.munaylab

import org.munaylab.osc.Organizacion
import org.munaylab.osc.RegistroCommand
import org.munaylab.osc.UserOrganizacion
import org.munaylab.security.ConfirmacionCommand

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class OrgController {

    def organizacionService

    def index() {
        render view: '/landing/organizaciones'
    }

    def registro(RegistroCommand command) {
        def map = [from: 'registro', view: '/landing/organizaciones']
        withForm {
            if (!command.hasErrors()) {
                def org = organizacionService.registrar(command)
                if (org && !org.hasErrors()) {
                    UserOrganizacion admin = org.admins.first()
                    map << [view: '/landing/confirmacion', org: org, adminId: admin.user.id]
                    return
                } else {
                    map << [org: org]
                }
            } else {
                map << [obj: command]
            }
        }.invalidToken {
            map << [error: 'error.invalid.token']
        }
        render view: map.view, model: map
    }

    def confirmacion(ConfirmacionCommand command) {
        def map = [adminId: command.refId]
        withForm {
            if (!command.hasErrors()) {
                String errorCode = organizacionService.confirmar(command)
                if (!errorCode){
                    redirect controller: 'admin'
                } else {
                    map << [error: errorCode]
                }
            } else {
                map << [obj: command]
            }
        }.invalidToken {
            map << [error: 'error.invalid.token']
        }
        render view: '/landing/confirmacion', model: map
    }

    def buscar() {
        Organizacion org = organizacionService.buscarPorNombre(params.nombreURL)
        if (org) {
            render view: 'index', model: [org: org]
        } else {
            render status: 404
        }
    }

}
