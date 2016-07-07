package testblog

class UserController {
    def beforeInterceptor = [action:this.&auth, except:["login","logout", "authenticate"]]

	def auth() {
		if(!session.user) {
			redirect(controller:"user", action:"login")
			return false
		}
	}

    def scaffold = User
  
	def login = {}
  
	def authenticate = {
		def user = User.findWhere(login:params['login'], password:params['password'])
		session.user = user
		if(user){
			flash.message = "Hello ${user.name}!"
			redirect(controller:"entry", action:"index")      
		}
		else{
			flash.message = "Sorry, ${params.login}. Please try again."
			redirect(action:"login")
		}
	}
  
	def logout = {
		flash.message = "Goodbye ${session.user.name}"
		session.user = null
		redirect(controller:"entry", action:"index")      
	}
}
