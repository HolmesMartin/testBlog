require 'page-object'

class HomePage
  include PageObject
  page_url 'http://localhost:8080/testBlog/'
  divs(:blog_result_summaries, :class => 'summary')

  h2(:blog_row1, :id => 'blogId0')

  link(:choose_blog, :xpath => '//h2[@id="blogId0"]/parent::a')
  text_field(:search_for_blog, :id => 'blogSearch')
  button(:submit, :value => 'Search')

  link(:new_entry, :class => 'create')
  link(:logout, :href => '/testBlog/user/logout')
end

class SearchPage
  include PageObject
  page_url 'http://localhost:8080/blog/entry/index'

  divs(:search_results, :xpath => '//div[@class="entry"]/h2/a')
end
