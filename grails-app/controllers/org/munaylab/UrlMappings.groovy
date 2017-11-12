package org.munaylab

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        '/organizaciones/registro'(controller: 'org', action: 'registro')
        '/organizaciones/confirmacion'(view: '/landing/osc/confirmacion')
        '/organizaciones'(view: '/organizaciones')

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
