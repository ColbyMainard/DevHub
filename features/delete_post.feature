Feature: Delete a post
    As a user,
    I would like to delete a post
    To get rid of outdated/old projects

    Background:
        Given I am on the homepage
        
    Scenario: I try to delete a post I made
        Given I am logged in
        Given I create a new post that I didn't mean to
        When I try to delete my post
        Then the post should no longer exist

    Scenario: I try to delete a post someone else made
        Given I am logged in
        Given I see someone else's post that I don't like
        When I attempt to delete a post that isn't mine
        Then I get a warning message telling me I can't do that

    Scenario: I try to delete a post someone else made as a moderator
        Given I am logged in as a moderator
        Given I see someone else's post that I don't like
        When I attempt to delete a post that isn't mine
        Then the post should no longer exist

    Scenario: I try to delete a post while not logged in
        Given I am not logged in
        Given I see someone else's post that I don't like
        When I attempt to delete a post that isn't mine
        Then I get a warning message telling me I can't do that