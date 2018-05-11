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
                crearOrganizacion()
            }
        }

    }

    def crearRoles() {
        Role.findByAuthority('ROLE_OSC_USER')
            ?: new Role(authority: 'ROLE_OSC_USER').save()
        Role.findByAuthority('ROLE_OSC_CONTADOR')
            ?: new Role(authority: 'ROLE_OSC_CONTADOR').save()
        Role.findByAuthority('ROLE_OSC_ESCRITOR')
            ?: new Role(authority: 'ROLE_OSC_ESCRITOR').save()
        Role.findByAuthority('ROLE_OSC_ADMIN')
            ?: new Role(authority: 'ROLE_OSC_ADMIN').save()
        Role.findByAuthority('ROLE_USER')
            ?: new Role(authority: 'ROLE_USER').save()
    }

    void crearOrganizacion() {
        def admin = TipoUsuario.findByNombre('ADMINISTRADOR')
                ?: new TipoUsuario(nombre: 'ADMINISTRADOR').save()
        def user = User.findByUsername('mcaligares@gmail.com')
        if (!user) {
            user = new User().with {
                username    = 'mcaligares@gmail.com'
                nombre      = 'Augusto'
                apellido    = 'Caligares'
                password    = 'Pass1234!'
                it
            }.save()
            new UserRole(user: user, role: oscAdmin).save()
        }
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
            org.addToAdmins(new UserOrganizacion(user: user, tipo: admin)).save()
        }

        crearAsientos(org)
        agregarContactos(org)
    }

    void crearAsientos(org) {
        def bienes = new Categoria().with {
            nombre  = 'bienes'
            tipo    = TipoAsiento.INGRESO
            it
        }.save()
        def servicios = new Categoria().with {
            nombre  = 'servicios'
            tipo    = TipoAsiento.INGRESO
            it
        }.save()
        def varios = new Categoria().with {
            nombre  = 'varios'
            tipo    = TipoAsiento.EGRESO
            it
        }.save()
        def sueldos = new Categoria().with {
            nombre  = 'sueldos'
            tipo    = TipoAsiento.EGRESO
            it
        }.save()

        [90, 60, 30, 0].each { date ->
            [[categoria: varios, monto: 525.0], [categoria: sueldos, monto: 2350.0]].each {
                new Asiento().with {
                    organizacion    = org
                    monto           = it.monto
                    detalle         = 'egreso'
                    fecha           = new Date() - date
                    categoria       = it.categoria
                    tipo            = TipoAsiento.EGRESO
                    it
                }.save()
            }
            [[categoria: bienes, monto: 350.0], [categoria: servicios, monto: 3500.0]].each {
                new Asiento().with {
                    organizacion    = org
                    monto           = it.monto
                    detalle         = 'ingreso'
                    fecha           = new Date() - date
                    categoria       = it.categoria
                    tipo            = TipoAsiento.INGRESO
                    it
                }.save()
            }
        }
    }

    void agregarContactos(Organizacion org) {
        org.addToContactos(new Contacto(value: 'munaylab.org', tipo: TipoContacto.WEB))
        org.addToContactos(new Contacto(value: 'contacto@munaylab.org', tipo: TipoContacto.EMAIL))
        org.addToContactos(new Contacto(value: '(0388) 4250798', tipo: TipoContacto.TELEFONO))
        org.addToContactos(new Contacto(value: '(0388) 4381969', tipo: TipoContacto.CELULAR))
        org.save(failOnError: true)
    }

    def destroy = { }
}
