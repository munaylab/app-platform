package org.munaylab

import org.munaylab.contacto.*
import org.munaylab.contenido.*
import org.munaylab.direccion.*
import org.munaylab.osc.*
import org.munaylab.planificacion.*
import org.munaylab.user.*
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
    static UserCommand getAdminCommand() {
        def command = userCommand
        command.tipo = TipoUsuario.ADMINISTRADOR
        return command
    }
    static UserCommand getMiembroCommand() {
        def command = userCommand
        command.tipo = TipoUsuario.MIEMBRO
        command.cargo = 'Director Ejecutivo'
        return command
    }
    static User crearUser() {
        new User(nombre: 'Augusto', apellido: 'Caligares',
            username: 'mcaligares@gmail.com', password: 'password')
    }
    static UserOrganizacion crearAdminOrganizacion(Organizacion org) {
        new UserOrganizacion(user: crearUser(), organizacion: org, tipo: TipoUsuario.ADMINISTRADOR)
    }
    static UserOrganizacion crearMiembroOrganizacion(Organizacion org) {
        new UserOrganizacion(user: crearUser(), organizacion: org,
                tipo: TipoUsuario.MIEMBRO, cargo: 'Director Ejecutivo')
    }
    static ArticuloCommand getNosotrosCommand() {
        new ArticuloCommand(autorId: 1, titulo: 'Nosotros', tipo: TipoArticulo.NOSOTROS,
                contenido: 'nosotros contenido', imagen: 'imagen.jpg')
    }
    static ProgramaCommand getProgramaCommand() {
        new ProgramaCommand(orgId: 1, nombre: 'mi programa', imagen: 'imagen/de/mi/programa.jpg',
            descripcion: 'descripcion del programa')
    }
    static Programa crearPrograma() {
        new Programa(nombre: 'Innovaciones Sociales', imagen: 'programa/innovacion',
            descripcion: 'Brindar innovaciones a las osc.')
    }
    static ProyectoCommand getProyectoCommand() {
        new ProyectoCommand(programaId: 1, nombre: 'mi proyecto', imagen: 'imagen/de/mi/proyecto.jpg',
            descripcion: 'descripcion del proyecto')
    }
    static Proyecto crearProyecto() {
        new Proyecto(nombre: 'Taller de Innovaciones', imagen: 'proyecto/programa/innovacion',
            descripcion: 'Taller donde se exponen innovaciones para la sociedad')
    }
    static ActividadCommand getActividadCommand() {
        new ActividadCommand(proyectoId: 1, nombre: 'mi actividad', imagen: 'imagen/de/mi/actividad.jpg',
            descripcion: 'descripcion del actividad')
    }
    static Actividad crearActividad() {
        new Actividad(nombre: 'Presentacion Innovacion', imagen: 'proyecto/actividad/innovacion',
            descripcion: 'Presentacion de innovaciones realizadas en el taller')
    }
    static EventoCommand getEventoCommand() {
        new EventoCommand(orgId: 1, nombre: 'mi evento', imagen: 'imagen/de/mi/evento.jpg',
            descripcion: 'descripcion del evento')
    }
    static Evento crearEvento() {
        new Evento(nombre: 'Presentacion Plataforma', imagen: 'evento/presentacion.jpg',
            descripcion: 'Presentacion de la plataforma a las OSC locales')
    }
}
