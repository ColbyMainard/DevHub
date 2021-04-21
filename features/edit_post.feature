Feature: Edit a post
    As a user,
    I would like to edit a post
    To update the current status of my personal projects

    Background:
        Given I am on the homepage

    Scenario: I try to edit a post I made
        Given I am logged in
        Then pending

    Scenario: I try to edit a post someone else made
        Given I am logged in
        Then pending

    Scenario: I try to edit a post while not logged in
        Given I am not logged in
        Then pending