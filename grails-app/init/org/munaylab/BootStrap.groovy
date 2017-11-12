package org.munaylab

import org.munaylab.user.User

class BootStrap {

    def init = { servletContext ->
        log.info "initializing..."

        User u = new User(nombre: 'Augusto', apellido: 'Caligares',
            username: 'mcaligares@gmail.com', password: 'password').save(failOnError: true)
    }

    def destroy = {
    }
}
