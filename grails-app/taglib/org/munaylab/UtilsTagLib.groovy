package org.munaylab

import org.munaylab.balance.TipoAsiento

class UtilsTagLib {
    static defaultEncodeAs = [
                                selectProgramas: 'html',
                                selectProyectos: 'html',
                                selectCategorias: 'html'
                             ]

    def balanceService
    def planificacionService

    def selectProgramas = { attrs, body ->
        def programas = planificacionService.getProgramas(attrs.org)
        def model = [attrs: attrs, planificaciones: programas]
        out << render(template: '/taglib/selectPlanificacion', model: model)
    }

    def selectProyectos = { attrs, body ->
        def proyectos = planificacionService.getProyectos(attrs.org)
        def model = [attrs: attrs, planificaciones: proyectos]
        out << render(template: '/taglib/selectPlanificacion', model: model)
    }

    def selectCategorias = { attrs, body ->

        String htmlString = ''
        TipoAsiento tipo = attrs.tipo == 'egreso' ? TipoAsiento.EGRESO : TipoAsiento.INGRESO
        def categorias = balanceService.obtenerCategorias(tipo)

        categorias.each { categoria ->
            htmlString += printSelect(categoria)
        }
        out << render(template: '/taglib/select', model: [attrs: attrs, html: htmlString])
    }

    String printSelect(categoria, int nivel = 0) {
        String scape = ''
        nivel.times { scape += '&nbsp;' }
        def option = "<option value=\"${categoria.id}\">${scape} ${categoria.nombre}</option>"
        categoria?.subcategorias?.each { subcategoria ->
            option += printSelect(subcategoria, nivel + 1)
        }
        return option
    }
}
