include PageObject::PageFactory

Given(/^my favorite blogger has been very active$/) do
  visit_page LoginPage
  on_page LoginPage do |page|
    page.user_name = 'admin'
    page.password = 'admin'
    page.login
  end
  15.times do
    on_page HomePage do |page|
      page.new_entry
    end
    on_page NewEntry do |page|
      page.title = 'This is a test blog'
      page.content = 'This is only a test'
      page.submit_entry
    end
  end
  on_page HomePage do |page|
    page.logout
  end
end

Then(/^then I should see a summary of my favorite blogger's (\d+) most recent posts in reverse order$/) do |number|
  on_page HomePage do |page|
    expect(page.blog_result_summaries_elements.size).to eq(number.to_i)
    page.blog_result_summaries_elements.each do |blog_result_summary|
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
    page.search_results_elements.each do |search_result|
      expect(search_result.text).to match(/test/i)
    end
  end
end