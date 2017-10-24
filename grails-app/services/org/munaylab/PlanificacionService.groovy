package org.munaylab

import org.munaylab.osc.Organizacion
import org.munaylab.planificacion.Programa
import org.munaylab.planificacion.ProgramaCommand

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

}
