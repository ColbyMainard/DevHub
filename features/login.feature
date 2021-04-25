Feature: Login to an existing account
    As a user
    I want to be able to log in to an account I already made
    So that I can traverse the site easier

    Background:
        Given I am on the homepage
        Given I am not logged in

    Scenario: I try to log into an existing account with correct information
        Given I have created an account and logged out
        When I go to the login page and enter the correct information for that account
        Then I should be successfully logged in

    Scenario: I try to log into an existing account but have the wrong password
        Given I have created an account and logged out
        When I go to the login page and enter incorrect information for that account
        Then I should not be successfully logged in

    Scenario: I try to log into an account that doesn't exist
        Given I have not created account and try to log in
        When I go to the login page for that account
        Then I should not be successfully logged in