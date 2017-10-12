package org.munaylab.civil

import org.munaylab.contacto.Contacto
import org.munaylab.contacto.TipoContacto
import org.munaylab.direccion.Domicilio

class Persona {

    String nombre
    String apellido
    Date nacimiento
    Domicilio domicilio
    boolean enabled = true

    static hasMany = [
        contactos: Contacto
    ]

    static constraints = {
        nombre size: 3..50
        apellido size: 3..30
        nacimiento nullable: true,
            range: new Date().parse('yyyy/MM/dd', "${Calendar.instance[Calendar.YEAR] -99}/1/1")..new Date().parse('yyyy/MM/dd', "${Calendar.instance[Calendar.YEAR] -16}/1/1")
        domicilio nullable: true
    }

    Contacto getEmail() {
        contactos.find { it.tipo == TipoContacto.EMAIL }
    }

}
