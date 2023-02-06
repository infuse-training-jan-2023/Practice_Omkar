Feature: Save todo items in CSV file
	As a user I can save all todo items in a CSV file

  Scenario: Save all items in a CSV file
    When I save items in a CSV file
    Then The item should get added in a CSV file
    Then the api status code should be 200
    Then the api response content type should be application/json
