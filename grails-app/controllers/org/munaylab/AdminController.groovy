package org.munaylab

import org.munaylab.user.User
import org.munaylab.components.*
import org.munaylab.accounting.Asiento
import org.munaylab.accounting.AsientoCommand
import org.munaylab.accounting.TipoAsiento
import org.munaylab.accounting.TipoFiltro
import org.munaylab.osc.Organizacion
import org.munaylab.planificacion.EventoCommand

import grails.plugin.springsecurity.annotation.Secured

class AdminController {

    def balanceService
    def organizacionService
    def planificacionService
    def springSecurityService

    @Secured('ROLE_OSC_ADMIN')
    def perfil() {
        [org: organizacionActual]
    }

    @Secured(['ROLE_OSC_ADMIN', 'ROLE_OSC_CONTADOR'])
    def balance() {
        Organizacion org = organizacionActual
        //TODO obtener informe de egresos en una sola transaccion
        def datosEgresoSemanal = balanceService.obtenerBalancePorPeriodo(org, TipoAsiento.EGRESO, TipoFiltro.SEMANAL)
        def datosEgresoMensual = balanceService.obtenerBalancePorPeriodo(org, TipoAsiento.EGRESO, TipoFiltro.MENSUAL)
        def datosEgresoAnual = balanceService.obtenerBalancePorPeriodo(org, TipoAsiento.EGRESO, TipoFiltro.ANUAL)
        def datosIngresoSemanal = balanceService.obtenerBalancePorPeriodo(org, TipoAsiento.INGRESO, TipoFiltro.SEMANAL)
        def datosIngresoMensual = balanceService.obtenerBalancePorPeriodo(org, TipoAsiento.INGRESO, TipoFiltro.MENSUAL)
        def datosIngresoAnual = balanceService.obtenerBalancePorPeriodo(org, TipoAsiento.INGRESO, TipoFiltro.ANUAL)
        def balanceClasficado = balanceService.obtenerBalanceClasificado(org)
        def balanceAnual = balanceService.obtenerBalanceAnual(org)
        def ultimosMovimientos = balanceService.obtenerUltimosMovimientos(org)
        [org: org, balanceAnual: balanceAnual, ultimosMovimientos: ultimosMovimientos,
            egresosClasificados: balanceClasficado.egreso, ingresosClasificados: balanceClasficado.ingreso,
            datosEgresoSemanal: datosEgresoSemanal, datosEgresoMensual: datosEgresoMensual, datosEgresoAnual: datosEgresoAnual,
            datosIngresoSemanal: datosIngresoSemanal, datosIngresoMensual: datosIngresoMensual, datosIngresoAnual: datosIngresoAnual]
    }

    @Secured(['ROLE_OSC_ADMIN', 'ROLE_OSC_CONTADOR'])
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

    @Secured(['ROLE_OSC_ADMIN', 'ROLE_OSC_ESCRITOR'])
    def borrar(Long id) {
        switch (params.type) {
            case 'programa':
                planificacionService.eliminarPrograma(id)
                redirect action: 'planificacion'
            break
            case 'proyecto':
                planificacionService.eliminarProyecto(id)
                redirect action: 'planificacion'
            break
            case 'actividad':
                planificacionService.eliminarActividad(id)
                redirect action: 'planificacion'
            break
            default:
                redirect action: 'index'
            break
        }
    }

    @Secured(['ROLE_OSC_ADMIN', 'ROLE_OSC_ESCRITOR'])
    def evento(EventoCommand command) {
        def org = organizacionActual
        def panels = planificacionService.getResumen(org)
        def model = [org: org, panels: panels, form: 'formEvento']
        if (request.post) {
            withForm {
                def respuesta = planificacionService.actualizarEvento(command, org)
                model << respuesta.modelo
            }.invalidToken {
                model << [error: 'error.invalid.token']
            }
            if (!model.error) {
                redirect action: 'evento', id: model.valor.id
            } else {
                render view: 'planificacion', model: model
            }
        } else {
            def evento = planificacionService.getEvento(params.long('id'), org)
            model << [valor: evento, form: 'formEvento']
            render view: 'planificacion', model: model
        }
    }

    def voluntarios() { }

    @Secured(['ROLE_OSC_ADMIN', 'ROLE_OSC_CONTADOR', 'ROLE_OSC_ESCRITOR'])
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

      [org: organizacionActual, panels: panels, volunteers: volunteers, state: state]
    }

}
