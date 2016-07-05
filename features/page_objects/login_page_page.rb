require 'page-object'

class LoginPage
  include PageObject
  page_url 'http://localhost:8080/testBlog/user/login'
  text_field(:user_name, :id => 'login')
  text_field(:password, :id => 'password')
  button(:login, :value => 'Login')
end
