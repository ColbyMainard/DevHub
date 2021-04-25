Feature: Edit a user
    As a user,
    I would like to edit my information
    To keep my account current

    Background:
        Given I am on the homepage

    Scenario: I try to edit my own information
        Given I am logged in
        When I attempt to update the information in my profile
        Then I should see that the new information has been saved

    Scenario: I try to edit someone else's information
        Given I am logged in
        When I want to change someone else's information
        Then I should be redirected to the homepage with a warning message
    
    Scenario: I try to edit someone else's information as an admin
        Given I am logged in as admin
        When I want to change someone else's information
        Then I should successfully be able to update their information