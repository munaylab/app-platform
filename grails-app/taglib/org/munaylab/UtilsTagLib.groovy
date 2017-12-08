package org.munaylab

import org.munaylab.balance.TipoAsiento

class UtilsTagLib {
    static defaultEncodeAs = [selectCategorias:'html']

    def balanceService

    def selectCategorias = { attrs, body ->

        TipoAsiento tipo = attrs.tipo == 'egreso' ? TipoAsiento.EGRESO : TipoAsiento.INGRESO
        def categorias = balanceService.obtenerCategorias(tipo)

        out << "<select id=\"${attrs.id}\" name=\"${attrs.name}\" class=\"${attrs.'class'}\">"
        out << "<option value='' disabled selected>-</option>"

        categorias.each { categoria ->
            out << printSelect(categoria)
        }

        out << "</select>"
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
