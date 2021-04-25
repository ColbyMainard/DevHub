Feature: Login to an existing account
    As a user
    I want to be able to log out of an account I already made
    So that I can prevent someone from making an absolute idiot of me online

    Background:
        Given I am on the homepage
    
    Scenario: I try to log out while I am logged in
        Given I am logged in
        When I attempt to log out
        Then I should recieve a notice that I have successfully logged out
    
    Scenario: I try to log out while I am not logged in
        Given I am not logged in
        When I attempt to log out
        Then I should not succeed in logging out of a session that was never created