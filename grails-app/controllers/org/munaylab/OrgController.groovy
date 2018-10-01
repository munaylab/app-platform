package org.munaylab

import org.munaylab.osc.Organizacion
import org.munaylab.osc.RegistroCommand
import org.munaylab.osc.UserOrganizacion
import org.munaylab.security.Token
import org.munaylab.security.TipoToken
import org.munaylab.security.ConfirmacionCommand
import org.munaylab.user.User

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class OrgController {

    def emailService
    def securityService
    def organizacionService
    def springSecurityService

    def index() {}

    def registro(RegistroCommand command) {
        def map = [from: 'registro', view: '/index']
        withForm {
            if (!command.hasErrors()) {
                def org = organizacionService.registrar(command)
                if (org && !org.hasErrors()) {
                    UserOrganizacion admin = org.admins.first()
                    enviarMailDeRegistro(admin.user, org)
                    map << [view: 'confirmacion', org: org, adminId: admin.user.id]
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
    void enviarMailDeRegistro(User user, Organizacion org) {
        Token token = securityService.generarTokenConfirmacion(user)
        emailService.enviarRegistroOrg(user, org, token.codigo)
    }

    def confirmacion(ConfirmacionCommand command) {
        def map = [adminId: command.refId]
        withForm {
            if (!command.hasErrors()) {
                def token = securityService.validarToken(command.codigo, command.refId, TipoToken.CONFIRMACION)
                if (token) {
                    Organizacion org = organizacionService.confirmar(command, token.user)
                    if (!org.hasErrors()) {
                        emailService.enviarBienvenidaOrg(token.user, org)
                        springSecurityService.reauthenticate(token.user.username)
                        redirect controller: 'admin'
                    } else {
                        map << [error: org.errors.globalError.code]
                    }
                } else {
                    map << [error: 'error.security.token.invalido']
                }
            } else {
                map << [obj: command]
            }
        }.invalidToken {
            map << [error: 'error.invalid.token']
        }
        render view: 'confirmacion', model: map
    }

    def buscar() {
        Organizacion org = organizacionService.buscarPorNombre(params.nombreURL)
        if (org) {
            render view: 'paginadeorg', model: [org: org]
        } else {
            render status: 404
        }
    }

}
