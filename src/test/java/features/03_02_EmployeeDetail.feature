Feature: Employee Detail
  Background:

    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def expectedResult = read('resultEmployeeDetail.json')

  Scenario: Get an Employee Detail
    Given url baseUrl+'/api/v1/employee/113'
    And header Authorization = "Bearer " + authToken
    When method GET
    Then status 200
    Then match response == expectedResult