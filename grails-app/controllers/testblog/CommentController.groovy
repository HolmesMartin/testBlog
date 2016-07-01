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
	   
	def save() {
		def realEntry = Entry.findById("${params.entry}".toInteger())
		def commentInstance = new Comment(params)
		commentInstance.entry = realEntry
        if (!commentInstance.save(flush: true)) {
            render(view: "create", model: [commentInstance: commentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])
		redirect(controller:"entry", action:"show", id:"${params.entry}".toInteger())
	}
}
