package testblog

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
import testblog.Entry

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(CommentController)
@Mock([Entry, Comment])
class CommentControllerSpec extends Specification {

	//def testEntry = new Entry(title:'test',summary:'test',author:'test').save()
	
    def setup() {
    }

    def cleanup() {
    }

    void "test valid comment save"() {
		when:
			def entry1 = new Entry(title:"TEST1", author: "jdoe", summary: "the first test")
			mockDomain(Entry, [entry1])
			controller.params.entry = "1"
			controller.params.content = "this is a test string for content"
			controller.params.author = "Tester"
			controller.save()
		
		then:
			response.json.success == true
    }
    
    void "test invalid entry comment save"() {
    	when:
		    controller.params.entry = "3"
		    controller.params.content = "this is a test string for content"
		    controller.params.author = "Tester"
		    controller.save()
    
    	then:
    		response.json.success == false
    }

}
