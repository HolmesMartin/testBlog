require 'page-object'

class LoginPage
  include PageObject
  page_url 'http://localhost:8080/blog/user/login'
  div(:user_name, :class => 'userName')
  div(:password, :class => 'userPassword')
  button(:login, :value => 'loginButton')
end
