Feature: Get an items
  As a user I can get a todo item

  Scenario: Get an item
    When I search for an item
    Then I should get the item
    Then the api status code should be 200
    Then the api response content type should be application/json
