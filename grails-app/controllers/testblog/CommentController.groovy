package testblog

class CommentController {

	def scaffold = true

    def index() { }
    
    def fetchController = {
		def Comments = Comment.findAllByEntryId("%${params.value}%")
		render(view:"index", model: [value: params.value, Comments: Comments])
	   }
	   
	def save() {
		//TODO
	}
}
