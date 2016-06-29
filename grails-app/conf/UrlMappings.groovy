class UrlMappings {

	static mappings = {
        "/$controller/$action?/$title?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"Entry")
        "500"(view:'/error')
		
	}
	 
}
