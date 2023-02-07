Feature: Update an items
  As a user I can update a todo item

  Scenario: Update an item
    When I update an item
    Then The item should get updated
    Then the api status code should be 201
    Then the api response content type should be application/json
