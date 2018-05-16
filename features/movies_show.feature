Feature: Movies Show
  As a user
  I want to see the details of every movie

  Scenario: User sees movies show
    Given there are two movies in the list
    Given I go to the movies show for "Wizards"
    Then I should see the element ".show"
    And I should see the element ".movie-data"
    And I should see the element ".cast-information"
    And I should see the element ".showtime-information"
    And I should see the element ".trailer"
    And I should see the element ".btn-edit"
    And I should see the element ".btn-back"

  Scenario: User clicks on edit
    Given there are two movies in the list
    Given I go to the movies show for "Wizards"
    When I click on "edit"
    Then I should be on the movies edit for "Wizards"

  Scenario: User clicks on back
    Given there are two movies in the list
    Given I go to the movies show for "Wizards"
    When I click on "back"
    Then I should be on the movies index

  Scenario: User wants to add new role
    Given there are two movies in the list
    Given I go to the movies show for "Wizards"
    When I click on "add new role"
    Then I should be on the roles new page

  Scenario: User clicks on actor
    Given there are two roles in the list
    Given I go to the movies show for "Wizards"
    When I click on "Max"
    Then I should be on the actors show for "Max"

  Scenario: User clicks on role
    Given there are two roles in the list
    Given I go to the movies show for "Wizards"
    When I click on "Gandalf"
    Then I should be on the roles show for "Gandalf"

  Scenario: User wants to edit role
    Given there are two roles in the list
    Given I go to the movies show for "Wizards"
    When I click on edit for role "Gandalf"
    Then I should be on the roles edit for "Gandalf"

  Scenario: User wants to delete role
    Given there are two roles in the list
    Given I go to the movies show for "Wizards"
    When I click on delete for role "Gandalf"
    Then I should be on the movies show for "Wizards"
    Then I should not see "Gandalf"