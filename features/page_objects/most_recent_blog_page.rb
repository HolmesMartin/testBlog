require 'page-object'

class MostRecentBlog
  include PageObject
  div(:blog_post, :class => 'blogContent')

  page_url(:blog_url)
  divs(:posted_comments, :class => 'postedCommentContent')
  div(:posted_comment1, :id => 'postedComment1')

  text_field(:comment_content, :id => 'commentContent')
  button(:comment_submit, :id => 'commentSubmit')
end