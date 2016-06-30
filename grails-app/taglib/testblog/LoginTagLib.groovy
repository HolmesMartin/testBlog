package testblog

class LoginTagLib {
  def loginControl = {
    if(session.user){
      
      out << """${link(action:"logout", controller:"user",class:"btn btn-primary"){"<span class = \" glyphicon glyphicon-log-out\"></span> Logout"}}"""
	  out << "Hello ${session.user.name}"
    } else {
      out << """${link(action:"login", controller:"user",class:"btn btn-primary"){"<span class = \" glyphicon glyphicon-log-in\"></span> Login"}}"""      
    }
  }
}
