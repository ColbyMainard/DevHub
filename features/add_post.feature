Feature: Add a post
    As a user,
    I would like to create a post
    To share the current status of my personal projects

    Background:
        Given I am on the homepage
    
    Scenario: I try to create a post while not logged in
        Given I am not logged in
        When I attempt to create a new post
        Then I should be redirected to the homepage
    
    Scenario: I try to create a post while logged in
        Given I am logged in
        When I attempt to create a new post
        Then I should be brought to the new post form
        When I submit the new post form
        Then I should be able to find my post on the list of all posts