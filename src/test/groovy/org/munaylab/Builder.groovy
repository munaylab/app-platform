package org.munaylab

import org.munaylab.contacto.Contacto
import org.munaylab.contacto.ContactoCommand
import org.munaylab.contacto.TipoContacto
import org.munaylab.direccion.Domicilio
import org.munaylab.direccion.DomicilioCommand
import org.munaylab.osc.Organizacion
import org.munaylab.osc.OrganizacionCommand
import org.munaylab.osc.RegistroCommand
import org.munaylab.osc.EstadoOrganizacion
import org.munaylab.osc.TipoOrganizacion
import org.munaylab.user.User
import org.munaylab.user.UserCommand
import org.munaylab.utils.EmailService
import org.munaylab.security.ConfirmacionCommand
import org.munaylab.security.Token

class Builder {

    static def DATOS_ORG = [nombre: 'MunayLab', tipo: TipoOrganizacion.FUNDACION,
        fechaConstitucion: new Date() -10, objeto: 'brindar soluciones a las organizaciones sociales']
    static def DATOS_DOMICILIO = [calle: 'Peat 32', numero: '570', barrio: 'San Pedrito',
        localidad: 'San Salvador de Jujuy', provincia: 'Jujuy']

    static RegistroCommand getRegistroCommand() {
        new RegistroCommand(denominacion: 'Fundación MunayLab', tipo: TipoOrganizacion.FUNDACION,
            nombre: 'Augusto', apellido: 'caligares', email: 'mcaligares@gmail.com',
            telefono: '1234567', objeto: 'brindar soluciones a las organizaciones sociales')
    }
    static ConfirmacionCommand getConfirmacionCommand() {
        new ConfirmacionCommand(codigo: 'codigo', password1: 'asdQWE123', password2: 'asdQWE123')
    }
    static Organizacion crearOrganizacionConDatos(datos = DATOS_ORG) {
        new Organizacion(nombre: datos.nombre, objeto: datos.objeto, tipo: datos.tipo,
            fechaConstitucion: datos.fechaConstitucion, estado: EstadoOrganizacion.VERIFICADA)
    }
    static Domicilio crearDomicilioConDatos(datos = DATOS_DOMICILIO) {
        new Domicilio(calle: datos.calle, numero: datos.numero, barrio: datos.barrio,
                localidad: datos.localidad, provincia: datos.provincia)
    }
    static OrganizacionCommand getOrganizacionCommand() {
        new OrganizacionCommand(id: 1, fechaConstitucion: new Date() -100,
            tipo: TipoOrganizacion.ASOCIACION_CIVIL, nombre: 'Fundacion Internacional MunayLab',
            objeto: 'brindar soluciones innovadoras a ONGs')
    }
    static DomicilioCommand getDomicilioCommand() {
        new DomicilioCommand(id: 1, calle: 'Reconquista', numero: '1125', barrio: 'Centro',
            localidad: 'Cuidad Autonoma de Buenos Aires', provincia: 'Buenos Aires')
    }
    static OrganizacionCommand getOrganizacionConDomicilioCommand() {
        def command = organizacionCommand
        command.domicilio = domicilioCommand
        return command
    }
    static ContactoCommand getContactoCommand() {
        new ContactoCommand(value: 'mcaligares@gmail.com', tipo: TipoContacto.EMAIL)
    }
    static Contacto crearContacto() {
        new Contacto(value: 'mcaligares@gmail.com', tipo: TipoContacto.EMAIL)
    }
    static UserCommand getUserCommand() {
        new UserCommand(nombre: 'Augusto', apellido: 'Caligares', username: 'mcaligares@gmail.com')
    }
    static User crearUser() {
        new User(nombre: 'Augusto', apellido: 'Caligares',
            username: 'mcaligares@gmail.com', password: 'password')
    }

}
