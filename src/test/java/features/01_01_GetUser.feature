@test
Feature: Get User
  Background:
    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def expectedResult = read('resultGetUser.json')

  Scenario: Get User
    Given url baseUrl+'/api/v1/user'
    And header Authorization = "Bearer " + authToken
    When method GET
    Then status 200
    Then print response
    Then match response == expectedResult
