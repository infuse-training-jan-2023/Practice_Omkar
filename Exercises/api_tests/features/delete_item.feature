Feature: Delete an item
	As a user I should be able to delete a todo item

  Scenario: Delete an item
    When I delete an item
    Then The item should get deleted
    Then the api status code should be 201
    Then the api response content type should be application/json
