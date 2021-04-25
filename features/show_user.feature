Feature: Add a post
    As a user,
    I would like to view other users
    To get more information about them

    Background:
        Given I am on the homepage

    Scenario: I try to view someone else's information while logged in
        Given I am logged in
        When I go to the users index
        Then I should be able to see a list of other existing users
    
    Scenario: I try to view someone else's information while logged out
        Given I am not logged in
        When I go to the users index
        Then I should not be able to see a list of other existing users