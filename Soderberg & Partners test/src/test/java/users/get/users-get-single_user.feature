Feature: Get single user on reqres

  Background:
    * def user_id = 11
    * url "https://reqres.in/"

  Scenario: Get a user schema validation
    Given path "api/users", user_id
    When method get
    Then status 200
    And match $ == "#object"
    And def jsonSchemaExpected = read('../json/get_single_user_schema.json')
    And match $ == jsonSchemaExpected


  Scenario Outline: Get a user
    Given path "api/users", i
    When method get
    Then status 200
    And match $.data.id == '#i'
    And match $.data.last_name == "#(last_name)"
    And match $.data.avatar == "#(avatar)"
    And match $.data.first_name == "#(first_name)"
    And match $.data.email == "#(email)"

    Examples:
      | i   | last_name | first_name| email                     | avatar                                    |
      | 11  | Edwards   | George    | george.edwards@reqres.in  | https://reqres.in/img/faces/11-image.jpg  |


  Scenario: Get a single user not found
    Given path "api/users", 999999
    When method get
    Then status 404
