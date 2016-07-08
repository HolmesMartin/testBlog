Feature: Pagination of posts
  In order to organize the blog posts
  As a Reader
  I want to see a total of 10 blog posts per page with pages for subsequent posts

  Scenario: View Recent Blog Posts with pagination
    Given my favorite blogger has been very active
    When I visit the blog for my favorite blogger
    Then then I should see a summary of my favorite blogger's 10 most recent posts in reverse order
    And there should another page for any posts other than the top 10 posts
    And I should be able to click on next or numerical page label to see more posts

  Scenario: I search for a post
    Given I visit the blog for my favorite blogger
    When I search for a blog post
    Then When the results contain more than 10 results they should be paginated.