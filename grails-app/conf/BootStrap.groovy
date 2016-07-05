import grails.util.*
import testblog.*

class BootStrap {

	def init = { servletContext ->
		new User(login: 'test', password: 'test', name: 'test').save()
		def entry = new Entry(title: 'Test', author: 'test', summary: 'This is a test of the emergency broadcast system.  Do not be alarmed, this is only a test.')
		entry.save()
		new Comment(entry: Entry.findById(1), author: 'test', content: 'This is a test').save()
	}
	
    def destroy = {
    }
    
}
