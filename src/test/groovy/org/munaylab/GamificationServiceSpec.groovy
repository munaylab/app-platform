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
        org.addToProgramas(Builder.crearPrograma())
        org.addToContactos(Builder.crearContacto())
        org.save(flush: true)
    }

    void 'sumar puntos por completar perfil'() {
        given: 'org con todos los datos de perfil'
        def org = Organizacion.get(1)
        when:
        service.operarPuntosPerfil(org)
        then: 'se crea un puntaje y un historial de puntos de la org'
        Puntaje.count() == 1 && HistorialPuntaje.count() == 1
        Puntaje.findByOrganizacion(org).total == 10
    }
    void 'tratar de sumar puntos por completar perfil otra vez'() {
        given: 'org con todos los datos de perfil'
        def org = Organizacion.get(1)
        and: 'se suma puntos una primera vez'
        service.operarPuntosPerfil(org)
        when: 'se trata de volver a sumar puntos'
        service.operarPuntosPerfil(org)
        then: 'se crea solamente un puntaje y un historial de puntos de la org'
        Puntaje.count() == 1 && HistorialPuntaje.count() == 1
        Puntaje.findByOrganizacion(org).total == 10
    }
    void "tratar de sumar puntos con perfil incompleto"() {
        given: 'org con todos los datos de perfil'
        def org = Organizacion.get(1)
        and: 'cambiamos los datos para dejar un perfil incompleto'
        cambiarDatosPerfil(org, tipo, nombre, objeto, domicilio, fechaConstitucion, contactos)
        when:
        service.operarPuntosPerfil(org)
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
    void 'restar puntos por modificar datos de perfil'() {
        given: 'org con todos los datos de perfil'
        def org = Organizacion.get(1)
        and: 'se suma puntos por completar perfil'
        service.operarPuntosPerfil(org)
        and: 'cambiamos los datos para dejar un perfil incompleto'
        cambiarDatosPerfil(org, tipo, nombre, objeto, domicilio, fechaConstitucion, contactos)
        when: 'se trata de volver a sumar puntos'
        service.operarPuntosPerfil(org)
        then: 'el puntaje debe ser de 0 y el historial deshabilitado'
        Puntaje.count() == 1 && HistorialPuntaje.count() == 1
        Puntaje.findByOrganizacion(org).total == 0
        HistorialPuntaje.countByEnabled(false) == 1
        where: 'datos de perfil para cambiar'
        tipo  | nombre | objeto | domicilio | fechaConstitucion | contactos
        true  | true   | true   | true      | false             | true
    }
    def cambiarDatosPerfil(org, tipo, nombre, objeto, domicilio, fechaConstitucion, contactos) {
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
    void 'sumar puntos por publicar programa'() {
        given: 'org y programa con todos los datos'
        def org = Organizacion.get(1)
        def programa = org.programas.first()
        // 1 * service.sumarSiNoTienePuntos(_,_,_)
        when:
        service.operarPuntosPrograma(programa)
        then: 'se crea un puntaje y un historial de puntos de la org'
        Puntaje.count() == 1 && HistorialPuntaje.count() == 1
        Puntaje.findByOrganizacion(org).total == 3
    }
    void 'tratar de sumar puntos por publicar programa otra vez'() {
        given: 'org y programa con todos los datos'
        def org = Organizacion.get(1)
        def programa = org.programas.first()
        and: 'se suma puntos una primera vez'
        service.operarPuntosPrograma(programa)
        when: 'se trata de volver a sumar puntos'
        service.operarPuntosPrograma(programa)
        then: 'se crea solamente un puntaje y un historial de puntos de la org'
        Puntaje.count() == 1 && HistorialPuntaje.count() == 1
        Puntaje.findByOrganizacion(org).total == 3
    }
    void "tratar de sumar puntos con programa incompleto"() {
        given: 'org y programa con todos los datos'
        def org = Organizacion.get(1)
        def programa = org.programas.first()
        and: 'cambiamos los datos para dejar un programa incompleto'
        cambiarDatosPrograma(programa, nombre, descripcion, publicado)
        when:
        service.operarPuntosPrograma(programa)
        then: 'no se crea puntaje ni historial'
        Puntaje.count() == 0 && HistorialPuntaje.count() == 0
        Puntaje.findByOrganizacion(org) == null
        where: 'datos de programa para cambiar (al menos uno debe ser nulo)'
        nombre | descripcion | publicado
        false  | true        | true
        true   | false       | true
        true   | true        | false
    }
    void 'restar puntos por modificar datos de programa'() {
        given: 'org y programa con todos los datos'
        def org = Organizacion.get(1)
        def programa = org.programas.first()
        and: 'se suma puntos por completar programa'
        service.operarPuntosPrograma(programa)
        and: 'cambiamos los datos para dejar un programa incompleto'
        cambiarDatosPrograma(programa, nombre, descripcion, publicado)
        when: 'se trata de volver a sumar puntos'
        service.operarPuntosPrograma(programa)
        then: 'el puntaje debe ser de 0 y el historial deshabilitado'
        Puntaje.count() == 1 && HistorialPuntaje.count() == 1
        Puntaje.findByOrganizacion(org).total == 0
        HistorialPuntaje.countByEnabled(false) == 1
        where: 'datos de programa para cambiar'
        nombre | descripcion | publicado
        false  | true        | true
    }
    def cambiarDatosPrograma(programa, nombre, descripcion, publicado) {
        if (!nombre) programa.nombre = null
        if (!descripcion) programa.descripcion = null
        if (!publicado) programa.publicado = false
        programa.save(flush: true)
    }
}
