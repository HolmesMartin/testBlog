Then(/^the url should contain information about the post$/) do
  on_page MostRecentBlog do |page|
    expect(page.blog_url).to include('title_information') #TODO proper title check maybe add new blog first with known title
  end
end