package org.munaylab

import org.munaylab.osc.Organizacion
import org.munaylab.planificacion.Actividad
import org.munaylab.planificacion.ActividadCommand
import org.munaylab.planificacion.Programa
import org.munaylab.planificacion.ProgramaCommand
import org.munaylab.planificacion.Proyecto
import org.munaylab.planificacion.ProyectoCommand
import org.munaylab.user.User

import grails.plugin.springsecurity.SpringSecurityService
import grails.testing.gorm.DataTest
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class PlanificacionServiceSpec extends Specification
        implements ServiceUnitTest<PlanificacionService>, DataTest {

    void setupSpec() {
        mockDomains Organizacion
    }

    void "[PlanificacionService] - agregar programa"() {
        given:
        def org = Builder.crearOrganizacionConDatos().save(flush: true)
        when:
        def programa = service.actualizarPrograma(Builder.programaCommand)
        then:
        comprobarProgramaGuardado(org, programa)
    }
    void "[PlanificacionService] - modificar programa"() {
        given:
        def programa = Builder.crearPrograma()
        def org = Builder.crearOrganizacionConDatos().addToProgramas(programa).save(flush: true)
        and:
        def command = Builder.programaCommand
        command.id = programa.id
        when:
        programa = service.actualizarPrograma(command)
        then:
        comprobarProgramaGuardado(org, programa)
        comprobarDatosProgramaActualizados(programa, command)
    }
    void "[PlanificacionService] - eliminar programa"() {
        given:
        def programa = Builder.crearPrograma()
        def org = Builder.crearOrganizacionConDatos().addToProgramas(programa).save(flush: true)
        when:
        service.eliminarPrograma(programa)
        then:
        Programa.all.isEmpty() && org.programas.isEmpty() && Organizacion.get(1).programas.isEmpty()
    }
    void comprobarProgramaGuardado(Organizacion org, Programa programa) {
        assert programa != null && Programa.all.size() == 1
        assert org.programas.size() == 1 && Organizacion.get(1).programas.size() == 1
    }
    void comprobarDatosProgramaActualizados(Programa programa, ProgramaCommand command) {
        assert (programa.imagen == command.imagen && programa.nombre == command.nombre
                && programa.descripcion == command.descripcion)
        assert (Programa.get(1).imagen == command.imagen && Programa.get(1).nombre == command.nombre
                && Programa.get(1).descripcion == command.descripcion)
    }
    void "[PlanificacionService] - agregar proyecto"() {
        given:
        def programa = Builder.crearPrograma()
        def org = Builder.crearOrganizacionConDatos().addToProgramas(programa).save(flush: true)
        when:
        def proyecto = service.actualizarProyecto(Builder.proyectoCommand)
        then:
        comprobarProyectoGuardado(org, programa, proyecto)
    }
    void "[PlanificacionService] - modificar proyecto"() {
        given:
        def proyecto = Builder.crearProyecto()
        def programa = Builder.crearPrograma().addToProyectos(proyecto)
        def org = Builder.crearOrganizacionConDatos().addToProgramas(programa).save(flush: true)
        and:
        def command = Builder.proyectoCommand
        command.id = proyecto.id
        command.programaId = programa.id
        when:
        proyecto = service.actualizarProyecto(command)
        then:
        comprobarProyectoGuardado(org, programa, proyecto)
        comprobarDatosProyectoActualizados(proyecto, command)
    }
    void "[PlanificacionService] - eliminar proyecto"() {
        given:
        def proyecto = Builder.crearProyecto()
        def programa = Builder.crearPrograma().addToProyectos(proyecto)
        def org = Builder.crearOrganizacionConDatos().addToProgramas(programa).save(flush: true)
        when:
        service.eliminarProyecto(proyecto)
        then:
        Proyecto.all.isEmpty() && programa.proyectos.isEmpty()
        comprobarProgramaGuardado(org, programa)
    }
    void comprobarProyectoGuardado(Organizacion org, Programa programa, Proyecto proyecto) {
        comprobarProgramaGuardado(org, programa)
        assert proyecto != null && Proyecto.all.size() == 1
        assert programa.proyectos.size() == 1 && Programa.get(1).proyectos.size() == 1
    }
    void comprobarDatosProyectoActualizados(Proyecto proyecto, ProyectoCommand command) {
        assert (proyecto.imagen == command.imagen && proyecto.nombre == command.nombre
                && proyecto.descripcion == command.descripcion)
        assert (Proyecto.get(1).imagen == command.imagen && Proyecto.get(1).nombre == command.nombre
                &&Proyecto.get(1).descripcion == command.descripcion)
    }
    void "[PlanificacionService] - agregar actividad"() {
        given:
        def proyecto = Builder.crearProyecto()
        def programa = Builder.crearPrograma().addToProyectos(proyecto)
        def org = Builder.crearOrganizacionConDatos().addToProgramas(programa).save(flush: true)
        when:
        def actividad = service.actualizarActividad(Builder.actividadCommand)
        then:
        comprobarActividadGuardada(org, programa, proyecto, actividad)
    }
    void "[PlanificacionService] - modificar actividad"() {
        given:
        def actividad = Builder.crearActividad()
        def proyecto = Builder.crearProyecto().addToActividades(actividad)
        def programa = Builder.crearPrograma().addToProyectos(proyecto)
        def org = Builder.crearOrganizacionConDatos().addToProgramas(programa).save(flush: true)
        and:
        def command = Builder.actividadCommand
        command.id = actividad.id
        when:
        actividad = service.actualizarActividad(command)
        then:
        comprobarActividadGuardada(org, programa, proyecto, actividad)
        comprobarDatosActividadActualizados(actividad, command)
    }
    void "[PlanificacionService] - eliminar actividad"() {
        given:
        def actividad = Builder.crearActividad()
        def proyecto = Builder.crearProyecto().addToActividades(actividad)
        def programa = Builder.crearPrograma().addToProyectos(Builder.crearProyecto())
        def org = Builder.crearOrganizacionConDatos().addToProgramas(programa).save(flush: true)
        when:
        service.eliminarActividad(actividad)
        then:
        Actividad.all.isEmpty() && proyecto.actividades.isEmpty()
        comprobarProyectoGuardado(org, programa, proyecto)
    }
    void comprobarActividadGuardada(org, programa, proyecto, actividad) {
        comprobarProyectoGuardado(org, programa, proyecto)
        assert actividad != null && Actividad.all.size() == 1
        //assert proyecto.actividades.size() == 1
        assert Proyecto.get(1).actividades.size() == 1
    }
    void comprobarDatosActividadActualizados(Actividad actividad, ActividadCommand command) {
        assert (actividad.imagen == command.imagen && actividad.nombre == command.nombre
                && actividad.descripcion == command.descripcion)
        assert (Actividad.get(1).imagen == command.imagen && Actividad.get(1).nombre == command.nombre
                && Actividad.get(1).descripcion == command.descripcion)
    }
}
