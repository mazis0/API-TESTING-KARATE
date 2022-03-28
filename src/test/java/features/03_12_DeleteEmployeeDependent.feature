Feature: Delete Employee Dependent
  Background:

    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def requestBody =
    """
    {
    "sequenceNumber" : "1"
    }
    """
    * def requestBodyNegativeCase =
    """
    {
    "sequenceNumber" : "3"
    }
    """

    * def expectedResult =
    """
    {"error":{"status":"404","text":"Deleting Failed"}}
    """

  Scenario: Delete an Employee Dependent
    Given url baseUrl+'/api/v1/employee/113/dependent'
    And header Authorization = "Bearer " + authToken
    And request requestBody
    When method DELETE
    Then status 200
    Then match response.success == 'Successfully Deleted'


  Scenario: Invalid sequence number while delete an Employee Dependent
    Given url baseUrl+'/api/v1/employee/113/dependent'
    And header Authorization = "Bearer " + authToken
    And request requestBodyNegativeCase
    When method DELETE
    Then status 404
    Then match response == expectedResult