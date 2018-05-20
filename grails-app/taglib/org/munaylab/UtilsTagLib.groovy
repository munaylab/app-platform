package org.munaylab

import org.munaylab.balance.TipoAsiento

class UtilsTagLib {
    static defaultEncodeAs = [
                                selectProgramas: 'html',
                                selectProyectos: 'html',
                                selectCategorias: 'html',
                                formPlanificacion: 'html'
                             ]

    def balanceService
    def contenidoService
    def planificacionService

    def formPlanificacion = { attrs, body ->
        if (attrs.modal) {
            out << render(template: '/taglib/modalPlanificacion', model: attrs)
        } else {
            String template = "/admin/components/planificacion/${attrs.form}"
            out << render(template: template, model: [object: attrs.object])
        }
    }

    def selectProgramas = { attrs, body ->
        def programas = planificacionService.getProgramas(attrs.org)
        def model = [attrs: attrs, planificaciones: programas, parent: attrs.parent]

        out << render(template: '/taglib/selectPlanificacion', model: model)
    }

    def selectProyectos = { attrs, body ->
        def proyectos = planificacionService.getProyectos(attrs.org)
        def model = [attrs: attrs, planificaciones: proyectos, parent: attrs.parent]
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

    def selectArticulos = { attrs, body ->
        def articulos = contenidoService.obtenerTodosLosArticulos(attrs.org)
        def model = [attrs: attrs, items: articulos]
        out << render(template: '/taglib/selectArticulos', model: model)
    }

    def errores = { attrs, body ->
        out << render(template: '/taglib/errores', model: [value: attrs.value])
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
