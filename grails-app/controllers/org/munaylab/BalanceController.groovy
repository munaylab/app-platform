package org.munaylab

import org.munaylab.user.User
import org.munaylab.balance.Asiento
import org.munaylab.balance.AsientoCommand
import org.munaylab.osc.Organizacion

import org.grails.web.servlet.mvc.SynchronizerTokensHolder
import grails.converters.JSON

class BalanceController {

    def balanceService
    def organizacionService
    def springSecurityService

    def asiento(AsientoCommand command) {
        def map = [:]
        withForm {
            map << [token : getToken(params.uri)]
            if (!command.hasErrors()) {
                command.orgId = organizacionActual.id
                Asiento asiento = balanceService.actualizarAsiento(command)
                if (asiento) {
                    map.put(command.esIngreso ? 'ingresoGuardado' : 'egresoGuardado', asiento)
                } else {
                    map << [error: 'error.al.guardar']
                }
            } else {
                map.put(command.esIngreso ? 'ingreso' : 'egreso', command)
            }
        }.invalidToken {
            map << [error: 'error.invalid.token']
        }
        render map as JSON
    }

    String getToken(String uri) {
        SynchronizerTokensHolder.store(session).generateToken(uri)
    }

    Organizacion getOrganizacionActual() {
        User user = springSecurityService.currentUser
        organizacionService.getOrganizacionActualDe(user)
    }
}
