package org.munaylab

import grails.testing.web.taglib.TagLibUnitTest
import spock.lang.Specification

class UtilsTagLibSpec extends Specification implements TagLibUnitTest<UtilsTagLib> {

    def setup() {
    }

    def cleanup() {
    }

    void "select categories"() {
        given:
        def select = '''<select id="selectEgreso" name="" class="">
        <option value='' disabled selected>-</option>
        </select>
        '''
        when:
        def html = taglib.selectCategories(tipo: 'egreso', id: 'selectEgreso')
        then:
        html == select
    }
}
