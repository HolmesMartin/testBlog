When(/^I choose a blog post$/) do
  on_page HomePage do |page|
    page.choose_blog
  end
end

Given(/^I visit the blog for my favorite blogger$/) do
  visit_page HomePage
end

Then(/^I should see comments left by other readers$/) do
  on_page MostRecentBlog do |page|
    page.posted_comments_elements.each do |postedCommentContent|
      expect(postedCommentContent).not_to be_nil
    end
  end
end

Given(/^I am reading a blog post from my favorite blogger$/) do
  visit_page HomePage
  on_page HomePage do |page|
    page.choose_blog
  end
end

When(/^I add my genius comment to the blog post$/) do
  on_page MostRecentBlog do |page|
    page.comment_author = 'Dustin'
    page.comment_content = 'This blog is so horrible'
    page.comment_submit
    sleep 1
  end
end

Then(/^my genius comment is at the top of the blog post comments$/) do
  on_page MostRecentBlog do |page|
    expect(page.posted_comments_elements[0].text).to eq('This blog is so horrible')
  end
end