package org.munaylab

import org.munaylab.user.User
import org.munaylab.components.*
import org.munaylab.balance.Asiento
import org.munaylab.balance.AsientoCommand
import org.munaylab.balance.TipoAsiento
import org.munaylab.balance.TipoFiltro
import org.munaylab.osc.Organizacion
import org.munaylab.osc.RegistroCommand
import org.munaylab.osc.UserOrganizacion
import org.munaylab.security.ConfirmacionCommand

class OrgController {

    def balanceService
    def organizacionService
    def springSecurityService

    def landing() {
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
                    redirect action: 'index'
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

    def perfil() {
        [org: organizacionActual]
    }

    def balance() {
        Organizacion org = organizacionActual
        //TODO obtener informe de egresos en una sola transaccion
        def datosEgresoSemanal = balanceService.generarInforme(org, TipoAsiento.EGRESO, TipoFiltro.SEMANAL)
        def datosEgresoMensual = balanceService.generarInforme(org, TipoAsiento.EGRESO, TipoFiltro.MENSUAL)
        def datosEgresoAnual = balanceService.generarInforme(org, TipoAsiento.EGRESO, TipoFiltro.ANUAL)
        def datosIngresoSemanal = balanceService.generarInforme(org, TipoAsiento.INGRESO, TipoFiltro.SEMANAL)
        def datosIngresoMensual = balanceService.generarInforme(org, TipoAsiento.INGRESO, TipoFiltro.MENSUAL)
        def datosIngresoAnual = balanceService.generarInforme(org, TipoAsiento.INGRESO, TipoFiltro.ANUAL)
        def balanceClasficado = balanceService.obtenerBalanceClasificado(org)
        [org: org, egresosClasificados: balanceClasficado.egreso, ingresosClasificados: balanceClasficado.ingreso,
            datosEgresoSemanal: datosEgresoSemanal, datosEgresoMensual: datosEgresoMensual, datosEgresoAnual: datosEgresoAnual,
            datosIngresoSemanal: datosIngresoSemanal, datosIngresoMensual: datosIngresoMensual, datosIngresoAnual: datosIngresoAnual]
    }

    def asiento(AsientoCommand command) {
        def map = [:]
        withForm {
            if (!command.hasErrors()) {
                command.orgId = organizacionActual.id
                Asiento asiento = balanceService.actualizarAsiento(command)
                if (!asiento) {
                    map << [error: 'error.al.guardar']
                } else {
                    map.put(command.esIngreso ? 'ingresoGuardado' : 'egresoGuardado', asiento)
                }
            } else {
                map.put(command.esIngreso ? 'ingreso' : 'egreso', command)
            }
        }.invalidToken {
            map << [error: 'error.invalid.token']
        }
        chain view: 'index', model: map
    }

    private Organizacion getOrganizacionActual() {
        User user = springSecurityService.currentUser
        organizacionService.getOrganizacionActualDe(user)
    }

    def donaciones() {

    }

    def voluntarios() {

    }

    def index() {
      def panels = []
      panels << new PanelVoluntarios(name: 'Voluntarios', value: '26', link: '#')
      panels << new EventsPanel(name: 'Eventos', value: '9', link: '#')
      panels << new MessagesPanel(name: 'Respuestas', value: '5', link: '#')
      panels << new StatePanel(name: 'Balance', value: '$ 300', link: '#')

      def volunteers = []
      volunteers << new VolunteersChart(date: Date.parse('yyyy-MM-dd', '2017-08-22'), actives: 9, pasives: 2, eventuals: 3)
      volunteers << new VolunteersChart(date: Date.parse('yyyy-MM-dd', '2017-08-23'), actives: 9, pasives: 5, eventuals: 1)
      volunteers << new VolunteersChart(date: Date.parse('yyyy-MM-dd', '2017-08-24'), actives: 9, pasives: 5, eventuals: 3)
      volunteers << new VolunteersChart(date: Date.parse('yyyy-MM-dd', '2017-08-25'), actives: 9, pasives: 10, eventuals: 7)
      volunteers << new VolunteersChart(date: Date.parse('yyyy-MM-dd', '2017-08-26'), actives: 12, pasives: 10, eventuals: 11)
      volunteers << new VolunteersChart(date: Date.parse('yyyy-MM-dd', '2017-08-27'), actives: 18, pasives: 14, eventuals: 15)

      def state = []
      state << [[date: Date.parse('yyyy-MM-dd hh:mm:ss', '2017-08-22 08:18:00'), amount: 100, type: 'ingress']]
      state << [[date: Date.parse('yyyy-MM-dd hh:mm:ss', '2017-08-22 18:51:00'), amount: 280, type: 'egress']]
      state << [[date: Date.parse('yyyy-MM-dd hh:mm:ss', '2017-08-23 09:46:00'), amount: 150, type: 'ingress']]
      state << [[date: Date.parse('yyyy-MM-dd hh:mm:ss', '2017-08-24 10:02:00'), amount: 400, type: 'ingress']]
      state << [[date: Date.parse('yyyy-MM-dd hh:mm:ss', '2017-08-25 12:36:00'), amount: 450, type: 'egress']]
      state << [[date: Date.parse('yyyy-MM-dd hh:mm:ss', '2017-08-26 11:24:00'), amount: 600, type: 'ingress']]

      [panels: panels, volunteers: volunteers, state: state]
    }

}
