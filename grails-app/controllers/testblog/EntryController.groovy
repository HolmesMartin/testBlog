package testblog

class EntryController {

	def beforeInterceptor = [action:this.&auth, except:["index", "show"]]

	def auth() {
		if(!session.user) {
			redirect(controller:"user", action:"login")
			return false
		}
	}

	def scaffold = Entry
	
}
