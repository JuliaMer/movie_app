#using the spreewald gem

Feature: Manage roles list
  As a user
  I want to manage a list of roles

  Scenario: User sees the roles index
    Given there are two roles in the list
    When I go to the roles index
    Then I should see a table with the following rows in any order:
      | Wizards | Gandalf         | edit | delete |
      | Witches | Bibi Blocksberg | edit | delete |

  Scenario: User adds a new role
    Given I go to the roles index
    Given there is a add role link
    When  I click on "add role"
    Then I should be on the roles new page


  Scenario: User clicks on a movie
    Given there are two roles in the list
    Given I go to the roles index
    When I click on "Wizards"
    Then it should redirect to the movies show for "Wizards"


  Scenario: User clicks on a character
    Given there are two roles in the list
    Given I go to the roles index
    When I click on "Gandalf"
    Then it should redirect to the roles show for "Gandalf"

  Scenario: User clicks on edit
    Given there are two roles in the list
    Given I go to the roles index
    Given there is a edit link for every role
    When I click on edit for role "Gandalf"
    Then it should redirect to the roles edit for "Gandalf"

  Scenario: User clicks on delete
    Given there are two roles in the list
    Given I go to the roles index
    Given there is a delete link for every role
    When I click on delete for role "Gandalf"
    Then I should be on the roles index
    Then I should not see "Gandalf"