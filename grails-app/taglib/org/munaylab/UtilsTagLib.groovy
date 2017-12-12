package org.munaylab

import org.munaylab.balance.TipoAsiento

class UtilsTagLib {
    static defaultEncodeAs = [selectCategorias:'html']

    def balanceService

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
