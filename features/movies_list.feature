Feature: Movies List
  As a user
  I want to manage a list of movies

  Scenario: User sees the movie index
    Given there are two movies in the list
    When I go to the movies index
    Then I should see a list of all movies

  Scenario: User adds a new movie
    Given I go to the movies index
    When I click on the add movie button
    Then I go to the movies new page

  Scenario: User clicks on a movie
    Given there are two movies in the list
    Given movie title is linked to movies show
    Given I go to the movies index
    Then I click on the movie title

  Scenario: User clicks on edit
    Given there are two movies in the list
    Given I go to the movies index
    When I click on edit
    Then I go to the actors edit

  Scenario: User clicks on delete
    Given there are two movies in the list
    Given I go to the movies index
    When I click on delete
    Then I go to the actors index