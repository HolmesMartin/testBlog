package testblog

class Entry {

	static constraints = {
		title()
		summary(maxSize:1000)
		dateCreated()
		lastUpdated()
		author()
	}

	static belongsTo = [author:User]
	String author
	String title
	String summary
	Date dateCreated
	Date lastUpdated
  
}
