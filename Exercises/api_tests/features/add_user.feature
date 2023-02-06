Feature: Register a user
	As a user I should be able to register a user

  Scenario: Register a user
    When I add a user
    Then The user should get added
    Then the api status code should be 201
    Then the api response content type should be application/json
