package org.munaylab

class UrlMappings {

    static mappings = {

        '/organizaciones'(method: 'GET', controller: 'admin', action: 'landing')
        '/organizaciones'(method: 'POST', controller: 'admin', action: 'registro')

        '/admin/balance/asiento'(method: 'POST', controller: 'admin', action: 'asiento')
        "/admin/borrar/$type/$id"(controller: 'admin', action: 'borrar')

        "/org/$nombreURL"(controller: 'org', action: 'index')

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
