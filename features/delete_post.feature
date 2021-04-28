Feature: Delete a post
    As a user,
    I would like to delete a post
    To get rid of outdated/old projects

    Background:
        Given the following posts exist:
        | post_title    | username      | updated_at |
        | Post_1        | test_user_1        |   2021-04-25|
        | Post_2        | test_user_1        |   2021-04-27|
        | Post_3        | test_user_2        |   2021-04-22|
        | Post_4        | test_user_3        |   2021-04-25|
        Given I am on the homepage
        
    Scenario: I try to delete a post I made
        Given I am logged in as test_user_1
        When I try to delete Post_1
        Then I should be able to successfully delete Post_1

    Scenario: I try to delete a post someone else made
        Given I am logged in as test_user_2
        When I try to delete Post_1
        Then I should not be able to successfully delete Post_1

    Scenario: I try to delete a post while not logged in
        Given I am not logged in
        When I try to delete Post_1
        Then I should not be able to successfully delete Post_1