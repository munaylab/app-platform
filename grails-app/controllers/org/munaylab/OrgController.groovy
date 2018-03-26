package org.munaylab

import org.munaylab.osc.Organizacion

class OrgController {

    def organizacionService

    def index() {
        Organizacion org = organizacionService.buscarPorNombre(params.nombreURL)
        if (org) {
            render view: 'index', model: [org: org]
        } else {
            render status: 404
        }
    }
}
