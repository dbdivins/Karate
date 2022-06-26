Feature: Get list users on reqres

  Background:
    * def page_number = 2
    * url "https://reqres.in/"
    * path "api/users"
    * param page = page_number


  Scenario: Get a list of user schema validation
    When method get
    Then status 200
    And match $ contains read('../json/get_list_of_users_schema.json')
    And match each $.data contains read('../json/get_list_of_users_item_schema.json')


  Scenario: Get a list of user
    When method get
    Then status 200
    And match $.page == page_number
    And match $ == read('../json/get_list_of_users_page2.json')


  Scenario: Get a list of user extract by id
    When method get
    Then status 200
    And def list_of_users = $
    And def user_id_to_extract = 11
    And def user = karate.jsonPath(list_of_users, "$.data[?(@.id==" + user_id_to_extract + ")]")[0]
    And print 'user ', user_id_to_extract, ': ', user
    And match user.last_name == "Edwards"
    And match user.id == user_id_to_extract
    And match user.avatar == "https://reqres.in/img/faces/11-image.jpg"
    And match user.first_name == "George"
    And match user.email == "george.edwards@reqres.in"


  Scenario: Get a list of user interact with 2 endpoints
    When method get
    Then status 200
    And def list_of_users = $
    And def user_id = 11
    And def user_from_list = karate.jsonPath(list_of_users, "$.data[?(@.id==" + user_id + ")]")[0]
    And print 'user ', user_id, 'from user list endpoint: ', user_from_list
    And call read("../get/users-get-single_user-snippets.feature@Get")
    And print 'user ', user_id, 'from user single endpoint: ', user
    And match user_from_list == user.data