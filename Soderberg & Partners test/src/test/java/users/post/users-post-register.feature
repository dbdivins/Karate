Feature: Post user on reqres

  Background:
    * url "https://reqres.in"
    * path "/api/register"


  Scenario: Post register unsuccessful missing password
    Given request { "email": "sydney@fife" }
    When method post
    Then status 400
    And match $.error == "Missing password"


  Scenario: Post a user unsuccessful missing email
    Given request { "password": "pistol" }
    When method post
    Then status 400
    And match $.error == "Missing email or username"


