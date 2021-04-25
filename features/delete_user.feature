Feature: Delete a user
    As a user,
    I would like to delete my account
    To clean up information about my projects
    
    Background:
        Given I am on the homepage

    Scenario: I try to delete my own account
        Given I am logged in
        When I visit my profile and click delete
        Then my account has been deleted

    Scenario: I try to delete someone else's account
        Given I am logged in
        And I see the account of someone I don't like
        When I visit their account and try to delete them
        Then their account should not be deleted

    Scenario: I try to delete my own account while not logged in
        Given I am not logged in
        When I visit my profile and click delete
        Then my account should not be deleted

    Scenario: I try to delete someone else as a moderator
        Given I am logged in as a moderator
        And I see the account of someone I don't like
        When I visit their account and try to delete them
        Then their account should not be deleted