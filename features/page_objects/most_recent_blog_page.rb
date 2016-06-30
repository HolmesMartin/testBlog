require 'page-object'

class MostRecentBlog
  include PageObject
  div(:blog_post, :id => 'blogContent')

  divs(:posted_comments, :class => 'postedCommentContent')
  div(:posted_comment1, :id => 'postedComment1')

  text_field(:comment_content, :id => 'commentContent')
  button(:comment_submit, :id => 'commentSubmit')

  h1(:blog_title, :id => 'blogTitle')

  def title_words
    title_words_array =  self.blog_title.split
    return title_words_array
  end

  link(:new_entry, :class => 'create')
end