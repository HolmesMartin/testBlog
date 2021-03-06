require 'page-object'

class MostRecentBlog
  include PageObject
  div(:blog_post, :id => 'blogContent')

  divs(:all_comments, :class => 'comments')

  def newest_comment
    self.all_comments_elements[0].pre_element.text
  end

  text_field(:comment_author, :id => 'author')
  text_field(:comment_content, :id => 'content')
  button(:comment_submit, :id => 'commentSubmit')

  h2(:blog_title, :id => 'blogTitle')

  def title_words
    title_words_array =  self.blog_title.split
    return title_words_array
  end

  link(:new_entry, :class => 'create')
end