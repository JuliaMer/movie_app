Feature: Actors List
  As a user
  I want to manage a list of actors

  Scenario: User sees the actors index
    Given there are two actors in the list
    When I go to the actors index
    Then I should see a list of all actors

  Scenario: User adds a new actor
    Given I go to the actors index
    Given there is a add actor button
    When I click on the add actor button
    Then it should redirect to actors new page

  Scenario: User clicks on an actor
    Given there are two actors in the list
    Given I go to the actors index
    Given actor name is linked to actors show
    When I click on the actor name "Max"
    Then it should redirect to actors show for "Max"

  Scenario: User clicks on edit
    Given there are two actors in the list
    Given I go to the actors index
    Given there is a edit link for every actor
    When I click on edit for actor "Max"
    Then it should redirect to actors edit for "Max"

  Scenario: User clicks on delete
    Given there are two actors in the list
    Given I go to the actors index
    Given there is a delete link for every actor
    When I click on delete for actor "Max"
    Then it should redirect to actors index
    Then there should be no actor "Max"