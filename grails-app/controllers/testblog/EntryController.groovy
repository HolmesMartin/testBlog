package testblog

class EntryController {

	def beforeInterceptor = [action:this.&auth, except:["index", "show","search"]]

	def auth() {
		if(!session.user) {
			redirect(controller:"user", action:"login")
			return false
		}
	}

	def scaffold = Entry
	
	def search = {
		def Entrys = Entry.findAllByTitleIlike("%${params.value}%")
		render(view:'search', model: [value: params.value, Entrys: Entrys])
	   }
	
}