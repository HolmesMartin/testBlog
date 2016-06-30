package testblog

class LoginTagLib {
  def loginControl = {
    if(session.user){
      
      out << """${link(action:"logout", controller:"user",class:"btn btn-primary"){"Logout"}}"""
	  out << "Hello ${session.user.name}"
    } else {
      out << """${link(action:"login", controller:"user",class:"btn btn-primary"){"Login"}}"""      
    }
  }
}
