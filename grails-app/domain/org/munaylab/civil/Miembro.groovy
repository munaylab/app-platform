package org.munaylab.civil

class Miembro extends Persona {

    String cargo

    static constraints = {
        cargo size: 3..20
    }

}
