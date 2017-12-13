package org.munaylab

import grails.testing.web.taglib.TagLibUnitTest
import spock.lang.Specification

class UtilsTagLibSpec extends Specification implements TagLibUnitTest<UtilsTagLib> {

    def setup() {
        tagLib.balanceService = Mock(BalanceService)
    }

    void "select categorias vacias"() {
        given:
        1 * tagLib.balanceService.obtenerCategorias(_) >> { [] }
        def select = '''\
<select id="selectEgreso" name="" class="">
  <option value="" disabled selected>-</option>
  
</select>'''
        when:
        def html = tagLib.selectCategorias(tipo: 'egreso', id: 'selectEgreso')
        then:
        html.trim() == select.trim()
    }
    void "select categorias con elementos"() {
        given:
        1 * tagLib.balanceService.obtenerCategorias(_) >> { [[id: 1, nombre: 'nombre1']] }
        def select = '''\
<select id="selectEgreso" name="" class="">
  <option value="" disabled selected>-</option>
  <option value="1"> nombre1</option>
</select>'''
        when:
        def html = tagLib.selectCategorias(tipo: 'egreso', id: 'selectEgreso')
        then:
        html.trim() == select.trim()
    }
}
