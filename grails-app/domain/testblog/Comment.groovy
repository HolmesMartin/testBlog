package testblog

import java.util.Date;

class Comment {

    	static constraints = {
		content(maxSize:5000)
		dateCreated()
		lastUpdated()
		author()
	}

	static belongsTo = [entry:Entry]
	String content
	Date dateCreated
	Date lastUpdated
	String author

	String toString(){
		if (content.size()>20) {return comment.substring(0,19);} else return comment;
	}
}

