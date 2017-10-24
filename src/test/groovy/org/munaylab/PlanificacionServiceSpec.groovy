package org.munaylab

import org.munaylab.osc.Organizacion
import org.munaylab.planificacion.Programa
import org.munaylab.planificacion.ProgramaCommand
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

    void "[PlanificacionService] - agregar proyecto"() {
        given:
        def org = Builder.crearOrganizacionConDatos().save(flush: true)
        when:
        def programa = service.actualizarPrograma(Builder.programaCommand)
        then:
        programa != null && Programa.all.size() == 1
        Organizacion.get(1).programas.size() == 1
    }
    void "[PlanificacionService] - modificar proyecto"() {
        given:
        def programa = Builder.crearPrograma()
        def org = Builder.crearOrganizacionConDatos().addToProgramas(programa).save(flush: true)
        and:
        def command = Builder.programaCommand
        command.id = programa.id
        when:
        programa = service.actualizarPrograma(command)
        then:
        programa != null && Programa.all.size() == 1
        comprobarDatosActualizados(programa, command)
        Organizacion.get(1).programas.size() == 1
    }
    void "[PlanificacionService] - eliminar proyecto"() {
        given:
        def programa = Builder.crearPrograma()
        def org = Builder.crearOrganizacionConDatos().addToProgramas(programa).save(flush: true)
        when:
        service.eliminarPrograma(programa)
        then:
        Programa.all.size() == 0 && org.programas.isEmpty()
    }

    void comprobarDatosActualizados(Programa programa, ProgramaCommand command) {
        assert programa.imagen == command.imagen
        assert programa.nombre == command.nombre
        assert programa.descripcion == command.descripcion
    }
}
