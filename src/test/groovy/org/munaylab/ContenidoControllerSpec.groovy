package org.munaylab

import org.munaylab.ContenidoService
import org.munaylab.OrganizacionService
import org.munaylab.contenido.Articulo
import org.munaylab.osc.Organizacion

import grails.plugin.springsecurity.SpringSecurityService
import grails.testing.web.controllers.ControllerUnitTest
import org.grails.web.servlet.mvc.SynchronizerTokensHolder
import spock.lang.Specification

class ContenidoControllerSpec extends Specification
        implements ControllerUnitTest<ContenidoController> {

    def setup() {
        controller.contenidoService = Mock(ContenidoService)
        controller.organizacionService = Mock(OrganizacionService)
        controller.springSecurityService = Mock(SpringSecurityService)
    }

    def cleanup() {
    }

    void "listado de articulos"() {
        given:
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        1 * controller.contenidoService.obtenerTodosLosArticulos(_) >> { [new Articulo(), new Articulo()] }
        when:
        controller.index()
        then:
        response.status == 200
        model.org != null
        model.articulos.size() == 2
    }
    void "listado de articulos vacio"() {
        given:
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        1 * controller.contenidoService.obtenerTodosLosArticulos(_) >> { [] }
        when:
        controller.index()
        then:
        response.status == 200
        model.org != null
        model.articulos.isEmpty()
    }
    void "mostrar un articulo"() {
        given:
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        1 * controller.contenidoService.obtenerArticulo(_,_) >> { new Articulo() }
        when:
        controller.articulo(1)
        then:
        response.status == 200
        model.org != null
        model.articulo != null
    }
    void "mostrar un articulo no encontrado"() {
        given:
        1 * controller.organizacionService.getOrganizacionActualDe(_) >> { new Organizacion(id: 1) }
        1 * controller.contenidoService.obtenerArticulo(_,_) >> { null }
        when:
        controller.articulo(1)
        then:
        response.status == 200
        model.org != null
        model.articulo == null
    }

    void generateSessionToken(session, params, uri) {
        def tokenHolder = SynchronizerTokensHolder.store(session)
        params[SynchronizerTokensHolder.TOKEN_URI] = uri
        params[SynchronizerTokensHolder.TOKEN_KEY] = tokenHolder.generateToken(uri)
    }

}
