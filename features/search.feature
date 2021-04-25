Feature: Search posts
    As an internet user,
    I would like to search for posts
    To get more information about projects that interest me

    Background:
        Given I am on the homepage
    
    Scenario: I want to search while logged in
        When I type in a search term into the search bar
        And I successfully submit the Search
        Then I should see a list of all posts that meet the criteria

    Scenario: I want to search while logged in
        When I type in a search term into the search bar
        And I successfully submit the Search
        Then I should see a list of all posts that meet the criteria