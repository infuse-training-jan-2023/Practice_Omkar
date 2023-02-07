Feature: Add an item
	As a user I should be able to add a todo item

  Scenario: Add an item
    When I add an item
    Then The item should get added
    Then the api status code should be 201
    Then the api response content type should be application/json
