package testblog

import grails.converters.JSON

class CommentController {
    
    def fetchComments = {
		params.entry = Entry.findById(params.entry.toInteger())
		def comments = Comment.findAllByEntry(params.entry)
		render(template:'results', model: [value: params.value, Comments: comments])
	}
	   
	def save = {
		def model = [:]
		params.entry = Entry.findById(params.entry.toInteger())
		def commentInstance = new Comment(params)

        if (!commentInstance.save(flush: true)) {
			model.success = false
        }
		else { model.success = true }
		
		render model as JSON
	}
	
}
