package testblog

import grails.test.mixin.TestFor
import spock.lang.Specification
import grails.util.Holders

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserSpec extends Specification {
	
    def setup() {
    }

    def cleanup() {
    }

    def config = Holders.config

    void "test nullable and blank constraints" (error, field, val) {
        when: 
            mockForConstraintsTests(User)
			mockForConstraintsTests(User, [new User(login: 'unique')])
            def obj = new User("$field": val)

        then: 
// These are set to ensure that an empty string isn't trimmed and converted to null
            validateConstraints(obj, field, error)

        where:
            error		| field			| val
            'valid'		| 'login'		| 'Good String'
            'valid'		| 'password'	| 'Good String'
            'valid'		| 'name'		| 'Good String'
			'nullable'	| 'login'		| ''
			'nullable'	| 'password'	| ''
			'nullable'	| 'name'		| ''
			'nullable'	| 'login'		| null
			'nullable'	| 'password'	| null
			'nullable'	| 'name'		| null
			'unique'	| 'login'		| 'unique'
    }

    private void validateConstraints(obj, field, error) {
       def validated = obj.validate()
       if (error && error != 'valid') {
           assert !validated
           assert obj.errors[field]
           assert error == obj.errors[field]
       } else {
           assert !obj.errors[field]
       }
   }
    
}
