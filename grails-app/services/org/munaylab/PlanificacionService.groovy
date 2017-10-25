package org.munaylab

import org.munaylab.direccion.Domicilio
import org.munaylab.osc.Organizacion
import org.munaylab.planificacion.Actividad
import org.munaylab.planificacion.ActividadCommand
import org.munaylab.planificacion.Evento
import org.munaylab.planificacion.EventoCommand
import org.munaylab.planificacion.Programa
import org.munaylab.planificacion.ProgramaCommand
import org.munaylab.planificacion.Proyecto
import org.munaylab.planificacion.ProyectoCommand

import grails.gorm.transactions.Transactional

@Transactional
class PlanificacionService {

    Programa actualizarPrograma(ProgramaCommand command) {
        if (!command || !command.validate()) return null

        Organizacion org = Organizacion.get(command.orgId)
        if (!org) return null

        Programa programa = command.id ? Programa.get(command.id) : null
        if (programa) {
            programa.actualizarDatos(command)
        } else {
            programa = new Programa(command.properties)
            org.addToProgramas(programa)
            org.save()
        }
        return programa
    }

    void eliminarPrograma(Programa programa) {
        if (!programa || !programa.organizacion) return

        Organizacion org = programa.organizacion
        org.removeFromProgramas(programa)
        programa.delete()
        org.programas.clear()
    }

    Proyecto actualizarProyecto(ProyectoCommand command) {
        if (!command || !command.validate()) return null

        Organizacion org = Organizacion.createCriteria().get {
            programas {
                eq 'id', command.programaId
            }
        }
        if (!org) return null

        Proyecto proyecto = command.id ? Proyecto.get(command.id) : null
        if (proyecto) {
            proyecto.actualizarDatos(command)
        } else {
            proyecto = new Proyecto(command.properties)
            Programa programa = org.programas.find { it.id == command.programaId }
            programa.addToProyectos(proyecto)
            org.save()
        }
        return proyecto
    }

    void eliminarProyecto(Proyecto proyecto) {
        if (!proyecto || !proyecto.programa) return

        Programa programa = proyecto.programa
        programa.removeFromProyectos(proyecto)
        proyecto.delete()
        programa.proyectos.clear()
    }

    Actividad actualizarActividad(ActividadCommand command) {
        if (!command || !command.validate()) return null

        Proyecto proyecto = Proyecto.get(command.proyectoId)
        if (!proyecto) return null

        Actividad actividad = command.id ? Actividad.get(command.id) : null
        if (actividad) {
            actividad.actualizarDatos(command)
        } else {
            actividad = new Actividad(command.properties)
            proyecto.addToActividades(actividad)
            proyecto.save()
        }
        return actividad
    }

    void eliminarActividad(Actividad actividad) {
        if (!actividad || !actividad.proyecto) return

        Proyecto proyecto = actividad.proyecto
        proyecto.removeFromActividades(actividad)
        actividad.delete()
        proyecto.actividades.clear()
    }

    Evento actualizarEvento(EventoCommand command) {
        if (!command || !command.validate()) return null

        Organizacion org = Organizacion.get(command.orgId)
        if (!org) return null

        Evento evento = command.id ? Evento.get(command.id) : null
        if (evento) {
            evento.actualizarDatos(command)
            if (command.direccion) {
                if (!evento.direccion) evento.direccion = new Domicilio()
                evento.direccion.actualizarDatos(command.direccion)
            }
        } else {
            evento = new Evento(command.properties)
            org.addToEventos(evento)
            org.save()
        }
        return evento
    }

    void cancelarEvento(Evento evento) {
        if (!evento || !evento.organizacion) return

        Organizacion org = evento.organizacion
        org.removeFromEventos(evento)
        evento.delete()
        org.eventos.clear()
    }
}
