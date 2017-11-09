package org.munaylab.osc

import org.munaylab.user.User
import org.munaylab.components.*
import org.munaylab.osc.Organizacion
import org.munaylab.osc.RegistroCommand
import org.munaylab.security.ConfirmacionCommand

class OrgController {

    def organizacionService

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

    def perfil() {
        def org = new Organizacion(nombre: 'Fundacion bla bla bla', objeto: 'Fundacion encargada de realizar tareas varias de lalala')
        org.miembros = [
            new User(nombre: 'Augusto', apellido: 'Caligares', cargo: 'Fundador'),
            new User(nombre: 'Augusto', apellido: 'Caligares', cargo: 'Tesorero')
        ]
        [org: org]
    }

    def balance() {

    }

    def donaciones() {

    }

    def voluntarios() {

    }

    def registro(RegistroCommand command) {
        def map = [:]
        withForm {
            if (!command.hasErrors()) {
                def org = organizacionService.registrar(command)
                if (org && !org.hasErrors()) {
                    render "org register ok"
                } else {
                    map << [obj: org]
                }
            } else {
                map << [obj: command]
            }
        }.invalidToken {
            map << [error: 'error.invalid.token']
        }
        render view: '/organizaciones', model: map
    }

    def confirmacion(String id) {
        def (token, user, org) = organizacionService.datosConfirmacion(id)
        if (!token) {
            render status: 404
            return
        }
        render view: 'confirmacion', model: [codigo: id, user: user, organizacion: org]
    }

    def _confirmacion(ConfirmacionCommand command) {
        def map = [codigo: params.codigo]
        withForm {
            if (!command.hasErrors()) {
                organizacionService.confirmar(command)
                redirect action: 'index'
            } else {
                map << [obj: command]
            }
        }.invalidToken {
            def (token, user, org) = organizacionService.datosConfirmacion(map.codigo)
            map << [user: user, organizacion: org, error: 'error.invalid.token']
        }
        render view: 'confirmacion', model: map
    }

}
