package org.munaylab

class UrlMappings {

    static mappings = {

        '/admin/balance/asiento'(method: 'POST', controller: 'admin', action: 'asiento')
        "/admin/borrar/$type/$id"(controller: 'admin', action: 'borrar')

        '/org'(method: 'GET', controller: 'org', action: 'index')
        '/org'(method: 'POST', controller: 'org', action: 'registro')
        "/org/confirmacion"(controller: 'org', action: 'confirmacion')

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
