package org.munaylab

import org.munaylab.user.User
import org.munaylab.user.TipoUsuario
import org.munaylab.osc.Organizacion
import org.munaylab.osc.EstadoOrganizacion
import org.munaylab.osc.TipoOrganizacion
import org.munaylab.osc.UserOrganizacion

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
    }

    def destroy = {
    }
}
