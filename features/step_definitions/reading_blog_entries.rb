include PageObject::PageFactory

Given(/^my favorite blogger has been very active$/) do
  visit_page HomePage
end

Then(/^then I should see a summary of my favorite blogger's 10 most recent posts in reverse order$/) do
  on_page HomePage do |page|
    page.blog_result_summaries.each do |blog_result_summary|
      expect(blog_result_summary).not_to be_nil
    end
  end
end

Then(/^I should see the blog post$/) do
  on_page MostRecentBlog do |page|
    expect(page.blog_post).not_to be_nil
  end
end

When(/^I search for a blog post$/) do
  on_page HomePage do |page|
    page.search_for_blog = 'test'
    page.submit
  end
end

Then(/^I should see posts with that value in the title$/) do
  on_page SearchPage do |page|
    page.search_results.each do |search_result|
      expect(search_result).to include('test')
    end
  end
end