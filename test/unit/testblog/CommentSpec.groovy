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
			def entry = new Entry(title:'test',summary:'test',author:'test')
			entry.save()
			String content = 'This is a test comment, this should be just a test.'
			String author = 'whomsoever'
			comment = new Comment(author:author, content:content, entry:entry)
			comment.save()
		
		then: "test comment should match"
			comment.author == author
			comment.content == content
			comment.entry == entry
	}

}
