package org.munaylab.admin

import org.munaylab.components.*

class AdminController {

    def panelService

    def index() {
        [panels: panelService.getAdminPanels()]
    }

    def organizaciones() {
        def panels = panelService.panelOrganizaciones
        def pendientes = panelService.organizacionesPendientes
        def registradas = panelService.organizacionesRegistradas
        def direcciones = panelService.direccionOrganizaciones
        [panels: panels, pendientes: pendientes, registradas: registradas, direcciones: direcciones]
    }
}
