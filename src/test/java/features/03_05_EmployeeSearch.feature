Feature: Employee Search
  Background:

    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def expectedResult = read('resultEmployeeSearch.json')

  Scenario: Search an Employee
    Given url baseUrl+'/api/v1/employee/search'
    And param name = "Muhammad test Azis"
    And header Authorization = "Bearer " + authToken
    When method GET
    Then status 200
    Then match response == expectedResult