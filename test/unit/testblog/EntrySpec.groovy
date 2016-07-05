package testblog

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Entry)
class EntrySpec extends Specification {
	
	def entry
	
	def setup() {
	}

	def cleanup() {
	}

	void "test good entry constraints"() {
		when: "test entry is made"
			String title = 'Test Title'
			String summary = 'This is a test blog, this should be just a test.'
			String author = 'whomsoever'
			entry = new Entry(title: title, summary: summary, author: author)
			entry.save()
		
		then: "test entry should match"
			entry.title == title
			entry.summary == summary
			entry.author == author
	}
}
