@test
Feature: Get Organization
  Background:
    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def expectedResult = read('resultGetOrganization.json')

  Scenario: Get Organization Detail
    Given url baseUrl+'/api/v1/organization'
    And header Authorization = "Bearer " + authToken
    When method GET
    Then status 200
    Then match response == expectedResult