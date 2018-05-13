package org.munaylab

import org.munaylab.contacto.Contacto
import org.munaylab.contacto.TipoContacto
import org.munaylab.user.User
import org.munaylab.categoria.TipoUsuario
import org.munaylab.osc.Organizacion
import org.munaylab.osc.EstadoOrganizacion
import org.munaylab.osc.TipoOrganizacion
import org.munaylab.osc.UserOrganizacion
import org.munaylab.balance.Asiento
import org.munaylab.balance.Categoria
import org.munaylab.balance.TipoAsiento
import org.munaylab.security.Role
import org.munaylab.security.UserRole

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        log.info "initializing..."

        crearRoles()
        environments {
            development {
                def user = crearUsuario()
                def org = crearOrganizacion(user)
                crearAsientos(org)
                agregarContactos(org)
            }
        }

    }

    private void crearRoles() {
        Role.findByAuthority('ROLE_OSC_USER')
            ?: new Role(authority: 'ROLE_OSC_USER').save(failOnError: true)
        Role.findByAuthority('ROLE_OSC_CONTADOR')
            ?: new Role(authority: 'ROLE_OSC_CONTADOR').save(failOnError: true)
        Role.findByAuthority('ROLE_OSC_ESCRITOR')
            ?: new Role(authority: 'ROLE_OSC_ESCRITOR').save(failOnError: true)
        Role.findByAuthority('ROLE_OSC_ADMIN')
            ?: new Role(authority: 'ROLE_OSC_ADMIN').save(failOnError: true)
        Role.findByAuthority('ROLE_USER')
            ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
    }

    private User crearUsuario() {
        def user = User.findByUsername('mcaligares@gmail.com')
        if (!user) {
            user = new User().with {
                username    = 'mcaligares@gmail.com'
                nombre      = 'Augusto'
                apellido    = 'Caligares'
                password    = 'Pass1234!'
                it
            }.save(failOnError: true)
            new UserRole(user: user, role: oscAdmin).save(failOnError: true)
        }
        return user
    }

    private Organizacion crearOrganizacion(User user) {
        def admin = TipoUsuario.findByNombre('ADMINISTRADOR')
                ?: new TipoUsuario(nombre: 'ADMINISTRADOR').save(failOnError: true)
        def org = Organizacion.findByNombre('MunayLab')
        if (!org) {
            org = new Organizacion().with {
                nombre      = 'MunayLab'
                nombreURL   = 'munaylab'
                tipo        = TipoOrganizacion.FUNDACION
                estado      = EstadoOrganizacion.REGISTRADA
                objeto      = 'Brindar herramientas innovadoras a las organizaciones de la sociedad civil.'
                it
            }
            .addToAdmins(new UserOrganizacion(user: user, tipo: admin))
            .save(failOnError: true)
        }
        return org
    }

    private void crearAsientos(Organizacion org) {
        def bienes = new Categoria().with {
            nombre  = 'bienes'
            tipo    = TipoAsiento.INGRESO
            it
        }.save(failOnError: true)
        def servicios = new Categoria().with {
            nombre  = 'servicios'
            tipo    = TipoAsiento.INGRESO
            it
        }.save(failOnError: true)
        def varios = new Categoria().with {
            nombre  = 'varios'
            tipo    = TipoAsiento.EGRESO
            it
        }.save(failOnError: true)
        def sueldos = new Categoria().with {
            nombre  = 'sueldos'
            tipo    = TipoAsiento.EGRESO
            it
        }.save(failOnError: true)

        def fechas = [90, 60, 30, 0]
        fechas.each { date ->
            def egresos = [[categoria: varios, monto: 525.0], [categoria: sueldos, monto: 2350.0]]
            egresos.each { egreso ->
                new Asiento().with {
                    organizacion    = org
                    monto           = egreso.monto
                    detalle         = 'egreso'
                    fecha           = new Date() - date
                    categoria       = egreso.categoria
                    tipo            = TipoAsiento.EGRESO
                    it
                }.save(failOnError: true)
            }
            def ingresos = [[categoria: bienes, monto: 350.0], [categoria: servicios, monto: 3500.0]]
            ingresos.each { ingreso ->
                new Asiento().with {
                    organizacion    = org
                    monto           = ingreso.monto
                    detalle         = 'ingreso'
                    fecha           = new Date() - date
                    categoria       = ingreso.categoria
                    tipo            = TipoAsiento.INGRESO
                    it
                }.save(failOnError: true)
            }
        }
    }

    private void agregarContactos(Organizacion org) {
        org.addToContactos(new Contacto(value: 'munaylab.org', tipo: TipoContacto.WEB))
        org.addToContactos(new Contacto(value: 'contacto@munaylab.org', tipo: TipoContacto.EMAIL))
        org.addToContactos(new Contacto(value: '(0388) 4250798', tipo: TipoContacto.TELEFONO))
        org.addToContactos(new Contacto(value: '(0388) 4381969', tipo: TipoContacto.CELULAR))
        org.save(failOnError: true)
    }

    def destroy = { }

}
