package testblog

import grails.test.mixin.TestFor
import spock.lang.Specification

@TestFor(Entry)
class EntrySpec extends Specification {
	
	def entry
	
	def setup() {
	}

	def cleanup() {
	}

	def "test entry constraints"() {		
		when:
			entry = new Entry(title:title, author:author, summary:summary)
		
		then:
			entry.validate()
			
		where:	
			title	|	author	|	summary
			"test"	|	"test"	|	"test"
	}
	
	def "test bad entry constraints"() {		
		when:
			entry = new Entry(title:title, author:author, summary:summary)
	
		then:
			!entry.validate()
			
		where:	
			title	|	author	|	summary
			""		|	"test"	|	"test"
			"test1"	|	""		|	"test1"
			"test2"	|	"test2"	|	""
	}
}
