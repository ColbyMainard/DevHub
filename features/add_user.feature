Feature:
    As a developer
    I would like to be able to make an account for myself
    So that I can have a richer experience within the app
    
    Background:
        Given I am on the homepage
        Given I am not logged in
    
    Scenario: I attempt to fill in every input in the form
        When I go to the new user form
        When I fill out the entire signup form correctly and submit it
        Then I should have successfully logged in as a new user
    
    Scenario: I messed up entering my password
        When I go to the new user form
        When I fill out the entire signup form and forget the verification password and submit it
        Then I should have unsuccessfully logged in as a new user