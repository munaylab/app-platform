package org.munaylab.components

import org.munaylab.components.*
import org.munaylab.direccion.Domicilio
import org.munaylab.osc.Organizacion
import org.munaylab.osc.EstadoOrganizacion
import grails.gorm.transactions.Transactional

@Transactional
class PanelService {

    def getAdminPanels() {
        def panels = []
        panels << new PanelVoluntarios(name: 'Voluntarios', value: '26', link: '#')
        panels << new PanelOrganizaciones(name: 'Organizaciones', value: '300', link: '#')
        panels << new EventsPanel(name: 'Eventos', value: '9', link: '#')
        panels << new MessagesPanel(name: 'Respuestas', value: '5', link: '#')
    }

    @Transactional(readOnly = true)
    def getPanelOrganizaciones() {
        def totalOrgRegistradas = Organizacion.countByEstadoAndEnabled(
            EstadoOrganizacion.REGISTRADA, Boolean.TRUE)
        def totalOrgPendientes = Organizacion.countByEstadoAndEnabled(
            EstadoOrganizacion.PENDIENTE, Boolean.TRUE)
        def panels = []
        panels << new PanelOrganizaciones(name: 'Registradas', value: "$totalOrgRegistradas", link: '#')
        panels << new PanelOrganizaciones(name: 'Pendientes', value: "$totalOrgPendientes", link: '#')
    }

    @Transactional(readOnly = true)
    def getOrganizacionesPendientes() {
        Organizacion.findAllByEstadoAndEnabled(EstadoOrganizacion.PENDIENTE, Boolean.TRUE)
    }

    def getOrganizacionesRegistradas() {
        def orgs = []
        orgs << new OrganizacionesChart(fecha: Date.parse('yyyy-MM-dd', '2017-08-02'), total: 3)
        orgs << new OrganizacionesChart(fecha: Date.parse('yyyy-MM-dd', '2017-08-10'), total: 5)
        orgs << new OrganizacionesChart(fecha: Date.parse('yyyy-MM-dd', '2017-08-14'), total: 7)
        orgs << new OrganizacionesChart(fecha: Date.parse('yyyy-MM-dd', '2017-08-22'), total: 9)
        orgs << new OrganizacionesChart(fecha: Date.parse('yyyy-MM-dd', '2017-09-05'), total: 13)
    }

    def getDireccionOrganizaciones() {
        def dires = []
        dires << new DireccionOrganizacionesChart(direccion: 'Palpala', total: 10)
        dires << new DireccionOrganizacionesChart(direccion: 'San Salvador de Jujuy', total: 14)
        dires << new DireccionOrganizacionesChart(direccion: 'Perico', total: 4)
        dires << new DireccionOrganizacionesChart(direccion: 'San Pedro', total: 5)
        dires << new DireccionOrganizacionesChart(direccion: 'Tilcara', total: 9)
    }
}
