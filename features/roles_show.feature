Feature: Actors Show
  As a user
  I want to see the details of every role

  Scenario: User clicks on edit
    Given there are two roles in the list
    Given I go to the roles show for "Gandalf"
    When I click on "edit"
    Then I should be on the roles edit for "Gandalf"

  Scenario: User clicks on back
    Given there are two roles in the list
    Given I go to the roles show for "Gandalf"
    When I click on "back"
    Then I should be on the roles index

  Scenario: User clicks on movie
    Given there are two roles in the list
    Given I go to the roles show for "Gandalf"
    When I click on "Wizards"
    Then I should be on the movies show for "Wizards"

  Scenario: User clicks on actor
    Given there are two roles in the list
    Given I go to the roles show for "Gandalf"
    When I click on "Max"
    Then I should be on the actors show for "Max"
