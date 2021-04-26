Feature: update a post from the post list

    As a post buff
    So that I can update a post from the post list that is already created
    I want to update a post

Background: posts in database

    Given the following posts exist:
    | Post Title    | Users     | Last Update |
    | Post 1        | User 1    |   2021-04-25|
    | Post 2        | User 1    |   2021-04-27|
    | Post 3        | User 2    |   2021-04-22|
    | Post 4        | User 3    |   2021-04-25|

Scenario: update a post with title
    Given I am on the edit page for "Post 1"
    When I fill in "Post Title" with "New Post"
    And I press "Update Post"
    Then I should be on the home page
    And I should see "New Post was successfully updated"
    And I should see "New Post"

Scenario: cancel updating a post with title
    Given I am on the edit page for "Post 1"
    And I fill in "Title" with "New Post"
    And I follow "Cancel"
    Then I should be on the home page
    And I should see "Post 1"
    And I should not see "New Post"