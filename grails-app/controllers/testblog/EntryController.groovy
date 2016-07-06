package testblog

class EntryController {

	def beforeInterceptor = [action:this.&auth, except:["index", "show", "redirectAgain", "search"]]

	def auth() {
		if(!session.user) {
			redirect(controller:"user", action:"login")
			return false
		}
	}
	
	def redirectAgain(){
		this.flash.message = flash.message
		def entry = Entry.findById("${params.id}")
		redirect uri:"/entry/show/" + params.id + "/" + (entry.title).replace(" ", "-") + "/"
	}
	
	def create = {
			
	}
	
	def index = {
		def value = params.value ?: params.q ?: ""	
		def entries
		def totalEntries
		
		totalEntries = Entry.findAllByTitleIlike("%${value}%").size()
		
		if (totalEntries > 0) {
			def offset = params.offset
			if (offset == null){offset = 0} else {offset = offset.toInteger()}
			def max = ((totalEntries - offset < 9) ? totalEntries - 1 : offset + 9)
			entries = Entry.findAllByTitleIlike("%${value}%")[offset..max]
		}
		else {entries = []}
		[entryInstanceList: entries, entryInstanceCount: totalEntries, params: params]
	}
	
	def search = {
		def Entrys = Entry.findAllByTitleIlike("%${params.value}%")
		render(view:"search", model: [value: params.value, Entrys: Entrys])
	}
	
	def show = {
		[entryInstance: Entry.findById("${params.id}")]
	}
	
	def save = {
		def entry = new Entry(params)
		if (!entry.save(flush: true)) {
            render(view: "create", model: [entryInstance: entry])
            return
        }
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'entry.label', default: 'Entry')])
        redirect(action: "show", id: entry.id)
	}
	
	def edit = {
		[entryInstance: Entry.findById("${params.id}")]
	}
	
	def delete = {
		def entry = Entry.findById("${params.id}")
		if (!entry.delete(flush: true)) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'entry.label', default: 'Entry')])
			redirect(view: "show", model: [entryInstance: entry])
			return
		}
		
		flash.message = message(code: 'default.deleted.message', args: [message(code: 'entry.label', default: 'Entry')])
		redirect(action: "index")
	}
}