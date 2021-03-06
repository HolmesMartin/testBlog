package testblog


class Comment {

	String author
	String content
	Date dateCreated
	Date lastUpdated
	Entry entry
	
	static belongsTo = [entry:Entry]
	
	static mapping = {
		sort dateCreated : "desc"
	}

    static constraints = {
		content size: 0..5000
	}

	String toString(){
		if (content.size()>20) {return comment.substring(0,19);} else return comment;
	}
}

