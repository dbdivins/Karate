Feature: Post user on reqres

  Background:
    * url "https://reqres.in"
    * path "/api/users"


  Scenario: Post a user schema validation
    Given request { "name": "Peter", "job": "Sales"}
    When method post
    Then status 201
    And def jsonSchemaExpected = read('../json/post_user_schema.json')
    And match $ == jsonSchemaExpected


  Scenario Outline: Post a user
    Given request { "name": "#(name)", "job": "#(job)"}
    When method post
    Then status 201
    And def user_id = $.id
    And match $.name == "#(name)"
    And match $.job == "#(job)"

    #The created user is not saved in a database, so the id returned is random. If we try to get the user by id, we will get nothing
    """
    /*
    And call read("../get/users-get-single_user-snippets.feature@Get")
    And print user
    And match user.name == $.name
    And match user.job == $.job
    */
    """

    Examples:
      | name  | job     |
      | Peter | Sales   |


  Scenario: Post a user without job
    Given request { "name": "Peter"}
    When method post
    Then status 201
    And match $.name == "Peter"
    And match $.job == "#notpresent"


  Scenario: Post a user without name
    Given request { "job": "Sales"}
    When method post
    Then status 201
    And match $.job == "Sales"
    And match $.name == "#notpresent"


  Scenario: Post a user with empty request
    Given request { }
    When method post
    Then status 201
    And match $.job == "#notpresent"
    And match $.name == "#notpresent"
