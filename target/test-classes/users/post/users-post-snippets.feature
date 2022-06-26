@ignore
Feature: Reusable scenarios for post user on reqres

@Create
  Scenario: Post a user

    Given url "https://reqres.in/api/users"
    And request { "name": "#(name)", "job": "#(job)"}
    When method post
    Then status 201
    And def contactId = $.id

    * print 'created id is: ', contactId