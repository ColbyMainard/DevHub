Feature: Edit a post
    As a user,
    I would like to edit a post
    To update the current status of my personal projects

    Background:
        Given I am on the homepage

    Scenario: I try to edit a post I made
        Given I am logged in
        And I made a post that contains a typo
        When I edit the post to remove the typo
        And I view the details of the post
        Then I should see the corrected post information

    Scenario: I try to edit a post someone else made
        Given I am logged in
        And I see someone else's post that I do not like
        When I attempt to edit the other person's post
        Then I should be redirected to the homepage with a warning message

    Scenario: I try to edit a post while not logged in
        Given I am not logged in
        And I made a post that contains a typo
        When I edit the post to remove the typo
        Then I should be redirected to the homepage with a warning message