package org.munaylab

import org.munaylab.gamification.HistorialPuntaje
import org.munaylab.gamification.Puntaje
import org.munaylab.osc.Organizacion

import grails.gorm.transactions.Transactional

@Transactional
class GamificationService {

    def grailsApplication

    def sumarPuntos(String evento, Organizacion org) {
        Integer puntos = grailsApplication.config.gamification.eventos[evento].puntos
        if (!puntos) return null

        if (HistorialPuntaje.countByEvento(evento) > 0) return null
        HistorialPuntaje historial = new HistorialPuntaje(evento: evento, puntos: puntos)

        Puntaje puntaje = Puntaje.findOrCreateByOrganizacion(org)
        if (!puntaje.total) puntaje.total = puntos
        puntaje.addToPuntos(historial)
        puntaje.save()
    }

    def sumarPuntosPerfil(Organizacion org) {
        org = comprobarDatosPerfil(org)
        if (!org.hasErrors()) {
            sumarPuntos(grailsApplication.config.gamification.eventos.perfil.nombre, org)
        }
    }

    @Transactional(readOnly = true)
    def comprobarDatosPerfil(Organizacion org) {
        if (!org.tipo) org.errors.rejectValue( 'tipo', 'org.tipo.null')
        if (!org.nombre) org.errors.rejectValue( 'nombre', 'org.nombre.null')
        if (!org.objeto) org.errors.rejectValue( 'objeto', 'org.objeto.null')
        if (!org.domicilio) org.errors.rejectValue( 'domicilio', 'org.domicilio.null')
        if (!org.fechaConstitucion) org.errors.rejectValue( 'fechaConstitucion', 'org.fechaConstitucion.null')
        if (org.contactos == null || org.contactos.isEmpty())
            org.errors.rejectValue( 'contactos', 'org.contactos.empty')
        return org
    }
}
