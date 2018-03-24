package org.munaylab

class UrlMappings {

    static mappings = {
        '/admin/balance/asiento'(method: 'POST', controller: 'admin', action: 'asiento')
        "/admin/borrar/$type/$id"(controller: 'admin', action: 'borrar')

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        '/organizaciones'(method: 'GET', controller: 'admin', action: 'landing')
        '/organizaciones'(method: 'POST', controller: 'admin', action: 'registro')

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
