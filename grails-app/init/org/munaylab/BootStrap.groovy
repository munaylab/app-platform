package org.munaylab

import org.munaylab.user.User
import org.munaylab.user.TipoUsuario
import org.munaylab.osc.Organizacion
import org.munaylab.osc.EstadoOrganizacion
import org.munaylab.osc.TipoOrganizacion
import org.munaylab.osc.UserOrganizacion
import org.munaylab.balance.Asiento
import org.munaylab.balance.Categoria
import org.munaylab.balance.TipoAsiento
import org.munaylab.planificacion.Actividad
import org.munaylab.planificacion.Proyecto
import org.munaylab.planificacion.Programa

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        log.info "initializing..."

        environments {
            development {
                crearOrganizacionParaPruebas()
            }
        }

    }

    void crearOrganizacionParaPruebas() {
        User user = new User(username: 'mcaligares@gmail.com', nombre: 'Augusto',
            apellido: 'Caligares', password: 'Pass1234!')
        Organizacion org = new Organizacion(nombre: 'MunayLab', tipo: TipoOrganizacion.FUNDACION, estado: EstadoOrganizacion.REGISTRADA,
            objeto: 'Brindar herramientas innovadoras a las organizaciones de la sociedad civil.')
        UserOrganizacion admin = new UserOrganizacion(user: user, organizacion: org, tipo: TipoUsuario.ADMINISTRADOR)
        org.addToAdmins(admin)
        org.save(failOnError: true)
        crearAsientos(org)
        crearPlanificacion(org)
    }

    void crearAsientos(org) {
        Categoria ingresoBienes = new Categoria(nombre: 'bienes', tipo: TipoAsiento.INGRESO).save()
        Categoria ingresoServicios = new Categoria(nombre: 'servicios', tipo: TipoAsiento.INGRESO).save()
        Categoria egresoVarios = new Categoria(nombre: 'varios', tipo: TipoAsiento.EGRESO).save()
        Categoria egresoSueldos = new Categoria(nombre: 'sueldos', tipo: TipoAsiento.EGRESO).save()

        new Asiento(organizacion: org, monto: 100.0, detalle: 'egreso', fecha: new Date()-90, categoria: egresoVarios, tipo: TipoAsiento.EGRESO).save()
        new Asiento(organizacion: org, monto: 150.0, detalle: 'egreso', fecha: new Date()-90, categoria: egresoSueldos, tipo: TipoAsiento.EGRESO).save()
        new Asiento(organizacion: org, monto: 200.0, detalle: 'ingreso', fecha: new Date()-90, categoria: ingresoBienes, tipo: TipoAsiento.INGRESO).save()
        new Asiento(organizacion: org, monto: 300.0, detalle: 'ingreso', fecha: new Date()-90, categoria: ingresoServicios, tipo: TipoAsiento.INGRESO).save()

        new Asiento(organizacion: org, monto: 80.0, detalle: 'egreso', fecha: new Date()-60, categoria: egresoVarios, tipo: TipoAsiento.EGRESO).save()
        new Asiento(organizacion: org, monto: 170.0, detalle: 'egreso', fecha: new Date()-60, categoria: egresoSueldos, tipo: TipoAsiento.EGRESO).save()
        new Asiento(organizacion: org, monto: 100.0, detalle: 'ingreso', fecha: new Date()-60, categoria: ingresoBienes, tipo: TipoAsiento.INGRESO).save()
        new Asiento(organizacion: org, monto: 200.0, detalle: 'ingreso', fecha: new Date()-60, categoria: ingresoServicios, tipo: TipoAsiento.INGRESO).save()

        new Asiento(organizacion: org, monto: 30.0, detalle: 'egreso', fecha: new Date()-30, categoria: egresoVarios, tipo: TipoAsiento.EGRESO).save()
        new Asiento(organizacion: org, monto: 170.0, detalle: 'egreso', fecha: new Date()-30, categoria: egresoSueldos, tipo: TipoAsiento.EGRESO).save()
        new Asiento(organizacion: org, monto: 150.0, detalle: 'ingreso', fecha: new Date()-30, categoria: ingresoBienes, tipo: TipoAsiento.INGRESO).save()
        new Asiento(organizacion: org, monto: 200.0, detalle: 'ingreso', fecha: new Date()-30, categoria: ingresoServicios, tipo: TipoAsiento.INGRESO).save()

        new Asiento(organizacion: org, monto: 30.0, detalle: 'egreso', fecha: new Date(), categoria: egresoVarios, tipo: TipoAsiento.EGRESO).save()
        new Asiento(organizacion: org, monto: 170.0, detalle: 'egreso', fecha: new Date(), categoria: egresoSueldos, tipo: TipoAsiento.EGRESO).save()
        new Asiento(organizacion: org, monto: 200.0, detalle: 'ingreso', fecha: new Date(), categoria: ingresoBienes, tipo: TipoAsiento.INGRESO).save()
        new Asiento(organizacion: org, monto: 300.0, detalle: 'ingreso', fecha: new Date(), categoria: ingresoServicios, tipo: TipoAsiento.INGRESO).save()
    }

    void crearPlanificacion(Organizacion org) {
        Actividad actividad = new Actividad(nombre: 'Presentacion Innovacion', imagen: 'proyecto/actividad/innovacion',
            descripcion: 'Presentacion de innovaciones realizadas en el taller', publicado: true)
        Proyecto proyecto = new Proyecto(nombre: 'Taller de Innovaciones', imagen: 'proyecto/programa/innovacion',
            descripcion: 'Taller donde se exponen innovaciones para la sociedad', publicado: true)
        Programa programa = new Programa(nombre: 'Innovaciones Sociales', imagen: 'programa/innovacion',
            descripcion: 'Brindar innovaciones a las osc.', publicado: true)

        proyecto.addToActividades(actividad)
        programa.addToProyectos(proyecto)
        org.addToProgramas(programa)
        org.save()
    }

    def destroy = {
    }
}
