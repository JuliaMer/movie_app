Feature: Manage Movies List
  As a user
  I want to manage a list of movies

  Scenario: User sees the movie index
    Given there are two movies in the list
    When I go to the movies index
    Then I should see a list of all movies

  Scenario: User adds a new movie
    Given I go to the movies index
    Given there is a add movie button
    When I click on the add movie button
    Then it should redirect to movies new page

  Scenario: User clicks on a movie
    Given there are two movies in the list
    Given I go to the movies index
    Given movie title is linked to movies show
    When I click on the movie title "Wizards"
    Then it should redirect to movies show for "Wizards"

  Scenario: User clicks on edit
    Given there are two movies in the list
    Given I go to the movies index
    Given there is a edit link for every movie
    When I click on edit for movie "Wizards"
    Then it should redirect to movies edit for "Wizards"

  Scenario: User clicks on delete
    Given there are two movies in the list
    Given I go to the movies index
    Given there is a delete link for every movie
    When I click on delete for movie "Wizards"
    Then it should redirect to movies index
    Then there should be no movie title "Wizards"

  Scenario: User searches for a movie title
    Given there are two movies in the list
    Given I go to the movies index
    Given there is a search form for movie titles
    When I search for "ards"
    Then it should redirect to movies search page
    Then it returns all matching movie titles