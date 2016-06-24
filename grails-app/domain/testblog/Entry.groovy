package testblog

class Entry {

	static constraints = {
		title()
		summary(maxSize:1000)
		dateCreated()
		lastUpdated()
	}

	static belongsTo = [author:User]

	String title
	String summary
	Date dateCreated
	Date lastUpdated
  
}
