Given(/^I am logged in as a blogger$/) do
  visit_page LoginPage
  on_page LoginPage do |page|
    page.user_name = 'test'
    page.password = 'test'
    page.login
  end
end

When(/^I publish a new blog post$/) do
  on_page HomePage do |page|
    page.new_entry
  end
  on_page NewEntry do |page|
    page.title = 'This is a test blog'
    page.content = 'This is only a test'
    page.submit_entry
  end
end

Then(/^I am notified that the blog post was successfully added$/) do
  on_page NewEntrySuccess do |page|
    expect(page.success_message).to include('created')
  end
end

And(/^the newly added blog post is at the top of the recent posts list$/) do
  visit_page HomePage
  on_page HomePage do |page|
    expect(page.blog_row1).to include('This is only a test')
  end
end