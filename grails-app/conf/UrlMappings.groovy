class UrlMappings {

	static mappings = {
<<<<<<< HEAD
        "/$controller/$action?/$title?(.$format)?"{
=======
        "/$controller/$action?/$id?(.$format)?/$title?"{
            constraints {
                
            }
        }
        
		"/entry/show/$id"(controller:"entry", action:"redirectAgain")

        "/"(controller:"entry")
        "500"(view:'/error')
		
	}
	 
}
