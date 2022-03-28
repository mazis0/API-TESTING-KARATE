Feature: Punch Out
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

  Scenario: Punch Out
    Given url baseUrl+'/api/v1/employee/113/punch-out'
    And header Authorization = "Bearer " + authToken
    And form fields requestBody
    When method POST
    Then status 200
    Then match response.success == 'Successfully Punched Out'