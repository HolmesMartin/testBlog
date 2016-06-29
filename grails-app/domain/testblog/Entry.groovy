package testblog

class Entry {

	static constraints = {
		title()
		summary(maxSize:5000)
		dateCreated()
		lastUpdated()
		author()
		comments(nullable:true)
	}
	
	static hasMany = [comments:Comment]
	String author
	String title
	String summary
	Date dateCreated
	Date lastUpdated
	
	static mapping = {
		sort dateCreated: "desc"
	}
}
