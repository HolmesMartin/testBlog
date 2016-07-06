package testblog

class EntryController {

	def beforeInterceptor = [action:this.&auth, except:["index", "show", "redirectAgain", "search"]]

	def auth() {
		if(!session.user) {
			redirect(controller:"user", action:"login")
			return false
		}
	}
	
	def index = {		
		def entries
		def totalEntries
		
		totalEntries = Entry.findAll().size()
		
		def offset = params.offset
		if (offset == null){offset = 0} else {offset = offset.toInteger()}
		def max = ((totalEntries - offset < 9) ? totalEntries : offset + 10) - 1
		entries = Entry.findAll()[offset..max]
		
		[entryInstanceList: entries, entryInstanceCount: totalEntries]
	}
	
	def create = {
		
	}
	
	def edit = {
		[entryInstance: Entry.findById("${params.id}")]
	}
	
	def save = {
		def entry = new Entry(params)
		entry.save()
		redirect(controller:"entry", action:"show", id:entry.id)
	}
	
	def search = {
		def Entrys = Entry.findAllByTitleIlike("%${params.value}%")
		render(view:"search", model: [value: params.value, Entrys: Entrys])
	   }

	def redirectAgain(){
		this.flash.message = flash.message
		def entry = Entry.findById("${params.id}")
    	redirect uri:"/entry/show/" + params.id + "/" + (entry.title).replace(" ", "-") + "/"
	}
	
	def show = {
		[entryInstance: Entry.findById("${params.id}")]
	}
}