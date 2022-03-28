Feature: Punch In
  Background:

    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def requestBody =
    """
    {
    "id" : "100",
    "timezone" : "Europe/London",
    "note" : "punch in",
    "datetime" : "2022-03-21 21:44"

    }
    """
    * def requestBodyNegativeCase =
    """
    {
    "id" : "100",
    "timezone" : "Europe/London",
    "note" : "punch in",
    "datetime" : " 21:44"

    }
    """
    * def expectedResult =
    """
    {"error":{"status":"202","text":"datetime must be a valid date. Sample format: \"2005-12-30 01:02\""}}
    """
  Scenario: Punch In
    Given url baseUrl+'/api/v1/employee/113/punch-in'
    And header Authorization = "Bearer " + authToken
    And form fields requestBody
    When method POST
    Then status 200
    Then match response.success == 'Successfully Punched In'

  Scenario: Invalid datetime while Punch In
    Given url baseUrl+'/api/v1/employee/113/punch-in'
    And header Authorization = "Bearer " + authToken
    And form fields requestBodyNegativeCase
    When method POST
    Then status 202
    Then match response == expectedResult