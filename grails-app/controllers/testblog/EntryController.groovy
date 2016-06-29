package testblog

class EntryController {

	def beforeInterceptor = [action:this.&auth, except:["index", "show", "redirectAgain", "search"]]

	def auth() {
		if(!session.user) {
			redirect(controller:"user", action:"login")
			return false
		}
	}

	def scaffold = Entry
	
	def search = {
		def Entrys = Entry.findAllByTitleIlike("${params.value}%")
		render(view:'search', model: [value: params.value, Entrys: Entrys])
	   }

	def redirectAgain(){
		def entry = Entry.findById("${params.id}")
    	redirect uri:"/entry/show/" + params.id + "/" + (entry.title).replace(" ", "-") + "/"
	}	
}