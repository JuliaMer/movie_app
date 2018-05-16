Feature: Actors Show
  As a user
  I want to see the details of every actor

  Scenario: User sees movies show
    Given there are two actors in the list
    Given I go to the actors show for "Max"
    Then I should see the element ".show"
    And I should see the element ".personal-data"
    And I should see the element ".filmography-data"
    And I should see the element ".btn-edit"
    And I should see the element ".btn-back"

  Scenario: User clicks on edit
    Given there are two actors in the list
    Given I go to the actors show for "Max"
    When I click on "edit"
    Then I should be on the actors edit for "Max"

  Scenario: User clicks on back
    Given there are two actors in the list
    Given I go to the actors show for "Max"
    When I click on "back"
    Then I should be on the actors index

  Scenario: User wants to add new role
    Given there are two actors in the list
    Given I go to the actors show for "Max"
    When I click on "add new role"
    Then I should be on the roles new page

  Scenario: User clicks on movie
    Given there are two roles in the list
    Given I go to the actors show for "Max"
    When I click on "Wizards"
    Then I should be on the movies show for "Wizards"

  Scenario: User clicks on role
    Given there are two roles in the list
    Given I go to the actors show for "Max"
    When I click on "Gandalf"
    Then I should be on the roles show for "Gandalf"

  Scenario: User wants to edit role
    Given there are two roles in the list
    Given I go to the actors show for "Max"
    When I click on edit for role "Gandalf"
    Then I should be on the roles edit for "Gandalf"

  Scenario: User wants to delete role
    Given there are two roles in the list
    Given I go to the actors show for "Max"
    When I click on delete for role "Gandalf"
    Then I should be on the movies show for "Wizards"
    Then I should not see "Gandalf"