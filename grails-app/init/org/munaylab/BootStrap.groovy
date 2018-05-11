package org.munaylab

import org.munaylab.contacto.Contacto
import org.munaylab.contacto.TipoContacto
import org.munaylab.contenido.Articulo
import org.munaylab.contenido.TipoArticulo
import org.munaylab.user.User
import org.munaylab.categoria.TipoUsuario
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
import org.munaylab.security.Role
import org.munaylab.security.UserRole

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        log.info "initializing..."

        crearRoles()
        environments {
            development {
                crearOrganizacionParaPruebas()
            }
        }

    }

    def crearRoles() {
        Role oscUser = Role.findByAuthority('ROLE_OSC_USER')
                ?: new Role(authority: 'ROLE_OSC_USER').save()
        Role oscContador = Role.findByAuthority('ROLE_OSC_CONTADOR')
                ?: new Role(authority: 'ROLE_OSC_CONTADOR').save()
        Role oscEscritor = Role.findByAuthority('ROLE_OSC_ESCRITOR')
                ?: new Role(authority: 'ROLE_OSC_ESCRITOR').save()
        Role oscAdmin = Role.findByAuthority('ROLE_OSC_ADMIN')
                ?: new Role(authority: 'ROLE_OSC_ADMIN').save()
        Role user = Role.findByAuthority('ROLE_USER')
                ?: new Role(authority: 'ROLE_USER').save()
        [oscContador, oscEscritor, oscAdmin, user]
    }

    void crearOrganizacionParaPruebas() {
        new TipoUsuario(nombre: 'ADMINISTRADOR').save(failOnError: true)
        User user = new User(username: 'mcaligares@gmail.com', nombre: 'Augusto',
            apellido: 'Caligares', password: 'Pass1234!')
        Organizacion org = new Organizacion(nombre: 'MunayLab', nombreURL: 'munaylab',
            tipo: TipoOrganizacion.FUNDACION, estado: EstadoOrganizacion.REGISTRADA,
            objeto: 'Brindar herramientas innovadoras a las organizaciones de la sociedad civil.')
        UserOrganizacion admin = new UserOrganizacion(user: user, organizacion: org,
            tipo: TipoUsuario.findByNombre('ADMINISTRADOR'))
        org.addToAdmins(admin)
        org.save(failOnError: true)

        Role adminRole = Role.findByAuthority('ROLE_OSC_ADMIN')
        UserRole userRole = new UserRole(user: user, role: adminRole).save(failOnError: true)

        crearAsientos(org)
        crearPlanificacion(org)
        agregarContactos(org)
        agregarArticulos(org, user)
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

    void agregarContactos(Organizacion org) {
        Contacto web = new Contacto(value: 'munaylab.org', tipo: TipoContacto.WEB)
        Contacto email = new Contacto(value: 'contacto@munaylab.org', tipo: TipoContacto.EMAIL)
        Contacto telefono = new Contacto(value: '(0388) 4250798', tipo: TipoContacto.TELEFONO)
        Contacto celular = new Contacto(value: '(0388) 4250798', tipo: TipoContacto.CELULAR)
        org.addToContactos(web)
        org.addToContactos(email)
        org.addToContactos(telefono)
        org.addToContactos(celular)
        org.save(failOnError: true)
    }

    void agregarArticulos(Organizacion org, User user) {
        Articulo mision = new Articulo(autor: user, titulo: 'Mision',
            imagen: 'http://placehold.it/900x800', tipo: TipoArticulo.OBJETIVO,
            contenido: '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>')
        Articulo nosotros = new Articulo(autor: user, titulo: 'Nosotros',
            imagen: 'http://placehold.it/900x800', tipo: TipoArticulo.NOSOTROS,
            contenido: '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>')
        Articulo programas = new Articulo(autor: user, titulo: 'Programas',
            imagen: 'http://placehold.it/900x800', tipo: TipoArticulo.PROGRAMAS,
            contenido: '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>')
        Articulo contacto = new Articulo(autor: user, titulo: 'Contacto',
            imagen: 'http://placehold.it/900x800', tipo: TipoArticulo.CONTACTO,
            contenido: '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>')
        Articulo contribuir = new Articulo(autor: user, titulo: 'Contribuir',
            imagen: 'http://placehold.it/900x800', tipo: TipoArticulo.CONTRIBUIR,
            contenido: '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>')
        org.addToArticulos(mision)
        org.addToArticulos(nosotros)
        org.addToArticulos(programas)
        org.addToArticulos(contacto)
        org.addToArticulos(contribuir)
        org.save(failOnError: true)
    }

    def destroy = {
    }
}
