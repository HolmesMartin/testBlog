require 'page-object'

class HomePage
  include PageObject
  page_url 'http://localhost:8080/blog/'
  divs(:blog_result_summaries, :class => 'blogPostSummary')

  def blog_row1
    self.blog_results[0]
  end

  link(:choose_blog, :id => 'blogId1')
  text_field(:search_for_blog, :id => 'blogSearch')
  button(:submit, :value => 'Search')

  button(:new_entry, :id => 'newEntry')
end

class SearchPage
  include PageObject
  page_url 'http://localhost:8080/blog/entry/index'

  divs(:search_results, :class => 'blogTitle')
end
