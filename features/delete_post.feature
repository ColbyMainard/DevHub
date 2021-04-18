Feature: Delete a post
    As a user,
    I would like to delete a post
    To get rid of outdated/old projects

    Background:
        Given I am on the homepage
        
    Scenario: I try to delete a post I made
        Given I am logged in
        Then pending

    Scenario: I try to delete a post someone else made
        Given I am logged in
        Then pending

    Scenario: I try to delete a post while not logged in
        Given I am not logged in
        Then pending