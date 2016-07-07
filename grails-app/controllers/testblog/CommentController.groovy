package testblog

import grails.converters.JSON

class CommentController {

	def scaffold = Comment

    def index() { }
    
    def fetchComments = {
		def realEntry = Entry.findById("${params.entry}".toInteger())
		def comments = Comment.findAllByEntry(realEntry)
		render(template:'results', model: [value: params.value, Comments: comments])
	   }
	   
	def save = {
		def model = [:]
		
		def realEntry = Entry.findById("${params.entry}".toInteger())
		def commentInstance = new Comment(params)
		commentInstance.entry = realEntry
        if (!commentInstance.save(flush: true)) {
			model.success = false
        }
		else { model.success = true }
		render model as JSON
	}
}
