package testblog

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test user constraints"() {
    	when: "test user is made"
    		String login = 'test'
    		String password = 'test'
    		String name = 'test'
    	
    	then: "test user should match"
    		user.login == login
    		user.password == password
    		user.name == name
    		
    }
    
}
