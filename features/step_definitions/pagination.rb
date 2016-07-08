Then(/^When the results contain more than (\d+) results they should be paginated\.$/) do |postCount|
  on_page TenPlus do |page|
    if page.results_elements.size > 10
    expect(page.paginated).to include('Next')
    end
  end
end

And(/^there should another page for any posts other than the top (\d+) posts$/) do |postCount|
  on_page Pagination do |page|
    expect(page.paginated).to include('Next')
  end
end

And(/^I should be able to click on next or numerical page label to see more posts$/) do
    on_page NumericPage do |page|
      page.numericPage
      expect(page.paginate).to include('Previous')
      page.numeric1
    end
    on_page NextPage do |page|
      page.nextPage
      expect(page.paginate).to include('Previous')
    end

end