Feature: Show a post
    As a user,
    I would like to view more information about a post
    To get more information about projects that interest me

    Background:
        Given I am on the homepage

    Scenario: I try to view a post's details while logged in
        Given I am logged in
        Then pending

    Scenario: I try to view a posts details while logged out
        Given I am not logged in
        Then pending