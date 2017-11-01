package org.munaylab

import org.munaylab.gamification.HistorialPuntaje
import org.munaylab.gamification.Puntaje
import org.munaylab.osc.Organizacion
import org.munaylab.osc.TipoOrganizacion
import org.munaylab.user.User

import grails.testing.gorm.DataTest
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class GamificationServiceSpec extends Specification
        implements ServiceUnitTest<GamificationService>, DataTest {

    void setupSpec() {
        mockDomains Organizacion, User, Puntaje
    }

    void setup() {
        def org = Builder.crearOrganizacionConDatos()
        org.domicilio = Builder.crearDomicilioConDatos()
        org.addToContactos(Builder.crearContacto()).save(flush: true)
    }

    void 'sumar puntos por completar perfil'() {
        given: 'org con todos los datos de perfil'
        def org = Organizacion.get(1)
        when:
        service.sumarPuntosPerfil(org)
        then: 'se crea un puntaje y un historial de puntos de la org'
        Puntaje.count() == 1 && HistorialPuntaje.count() == 1
        Puntaje.findByOrganizacion(org).total == 10
    }
    void "tratar de sumar puntos con perfil incompleto"() {
        given: 'org con todos los datos de perfil'
        def org = Organizacion.get(1)
        and: 'cambiamos los datos para dejar un perfil incompleto'
        cambiarDatosOrg(org, tipo, nombre, objeto, domicilio, fechaConstitucion, contactos)
        when:
        service.sumarPuntosPerfil(org)
        then: 'no se crea puntaje ni historial'
        Puntaje.count() == 0 && HistorialPuntaje.count() == 0
        Puntaje.findByOrganizacion(org) == null
        where: 'datos de perfil para cambiar (al menos uno debe ser nulo)'
        tipo  | nombre | objeto | domicilio | fechaConstitucion | contactos
        false | true   | true   | true      | true              | true
        true  | false  | true   | true      | true              | true
        true  | true   | false  | true      | true              | true
        true  | true   | true   | false     | true              | true
        true  | true   | true   | true      | false             | true
        true  | true   | true   | true      | true              | false
    }
    def cambiarDatosOrg(org, tipo, nombre, objeto, domicilio, fechaConstitucion, contactos) {
        if (!tipo) org.tipo = null
        if (!nombre) org.nombre = null
        if (!objeto) org.objeto = null
        if (!domicilio) org.domicilio = null
        if (!fechaConstitucion) org.fechaConstitucion = null
        if (!contactos) {
            def contacto = org.contactos.first()
            org.removeFromContactos(contacto)
            contacto.delete()
            org.contactos.clear()
        }
        org.save(flush: true)
    }

}
