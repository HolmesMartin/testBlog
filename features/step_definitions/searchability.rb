Then(/^the url should contain information about the post$/) do
  on_page MostRecentBlog do |page|
    (page.title_words).each do |word|
      expect(page.current_url).to include(word)
    end
  end
end