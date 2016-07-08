package testblog

import grails.test.mixin.TestFor
import spock.lang.Specification
import testblog.Entry

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Comment)
class CommentSpec extends Specification {
	
	def comment
	
	def setup() {
	}

	def cleanup() {
	}

	void "test good comment constraints"() {
		when: "test comment is made"
			def entry1 = new Entry(title: "TEST1", author: "jdoe", summary: "the first test")
			mockDomain(Entry, [entry1])
			def content = 'This is a test comment, this should be just a test.'
			def author = 'whomsoever'
			
			comment = new Comment(author:author, content:content, entry:entry1)
		
		then: "test comment should validate"
			comment.validate()
	}
	
	void "test invalid content comment constraint"() {
		when: "test comment is made"
			def entry1 = new Entry(title: "TEST1", author: "jdoe", summary: "the first test")
			mockDomain(Entry, [entry1])
			def content = ''
			def author = 'whomsoever'
	
			comment = new Comment(author:author, content:content, entry:entry1)
	
		then: "test comment should not validate"
			!comment.validate()
	}
	
	void "test invalid author comment constraint"() {
		when: "test comment is made"
			def entry1 = new Entry(title: "TEST1", author: "jdoe", summary: "the first test")
			mockDomain(Entry, [entry1])
			def content = 'This is a test comment, this should be just a test.'
			def author = ''
			
			comment = new Comment(author:author, content:content, entry:entry1)
	
		then: "test comment should not validate"
			!comment.validate()
	}

}
