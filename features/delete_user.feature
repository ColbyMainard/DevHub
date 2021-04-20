Feature: Delete a user
    As a user,
    I would like to delete my account
    To clean up information about my projects
    
    Background:
        Given I am on the homepage

    Scenario: I try to delete my own account
        Given I am logged in
        Then pending

    Scenario: I try to delete someone else's account
        Given I am logged in
        Then pending

    Scenario: I try to delete my own account while not logged in
        Given I am not logged in
        Then pending