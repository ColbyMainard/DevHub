Feature: Show a post
    As a user,
    I would like to view more information about a post
    To get more information about projects that interest me

    Background:
        Given I am on the homepage

    Scenario: I try to view a post's details while logged in
        Given I am logged in
        When I attempt to view the details of someone else's post
        Then I should see more information about their posts

    Scenario: I try to view a posts details while logged out
        Given I am not logged in
        When I attempt to view the details of someone else's post
        Then I should see more information about their posts