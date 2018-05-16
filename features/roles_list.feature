#using the spreewald gem

Feature: Manage roles list
  As a user
  I want to manage a list of roles

  Scenario: User sees the roles index
    Given there are two roles in the list
    When I go to the roles index
    Then I should see a table with the following rows in any order:
  | Wizards       | Gandalf         | edit | delete |
  | Witches       | Bibi Blocksberg | edit | delete |

