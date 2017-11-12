package org.munaylab

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        '/organizaciones'(method: 'GET', controller: 'org', action: 'landing')
        '/organizaciones'(method: 'POST', controller: 'org', action: 'registro')

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
