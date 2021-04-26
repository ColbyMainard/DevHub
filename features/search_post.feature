Feature: Search posts using Simple Search Button
    As anyone who can visit the site
    I want to be able to be able to search posts by keyword in title
    So that I can find posts more relevant to me

    Background:
        Given the following posts exist:
        | post_title                    | username  | post_description |
        | Ruby on Rails                 | User 1    | Rails is a web application framework running on the Ruby programming language.|
        | Introduction to Ruby          | User 2    | There are several curated lists of online resources for learning Ruby.|
        | Introduction to Rails         | User 3    | This guide is designed for beginners who want to get started with a Rails application from scratch.|
        | ElasticSearch: a search tool  | User 1    | Pending.|

        And I am on the homepage
        Then 4 seed posts should exist
        
    Scenario: I try to search a post by keyowrd 
        Given I am on the homepage
        When I fill in "search" with "Ruby"
        And I press "Simple Search"
        Then I should be redirected to the homepage
        And I should see "Ruby on Rails"
        And I should see "Introduction to Ruby"
        And I should not see "Introduction to Rails"