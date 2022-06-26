@ignore
Feature: Get single user on reqres

  @Get
  Scenario: Get a user schema validation
    Given url "https://reqres.in/"
    And path "api/users", user_id
    When method get
    Then status 200
    And def user = $