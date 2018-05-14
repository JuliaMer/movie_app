Feature: Actors List
  As a user
  I want to manage a list of actors

  Scenario: User sees the actors index
    Given there are two actors in the list
    When I go to the actors index
    Then I should see a list of all actors

  Scenario: User adds a new actor
    Given I go to the actors index
    When I click on the add actor button
    Then I go to the actors new page