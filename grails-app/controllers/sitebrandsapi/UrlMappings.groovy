package sitebrandsapi

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(redirect: "/brands/")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
