@test
Feature: Login
  Background:
    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def expectedResult =
    """
    {
    "login": true,
    "user": {
        "userName": "azisss",
        "userRole": "Admin",
        "status": "Enabled",
        "employeeName": "Muhammad Azis",
        "employeeId": "113"
    }
}
    """
    * def expectedResultNegativeCase =
    """
    {
    "error": {
        "status": "202",
        "text": "Credentials Are Wrong Please Try Again"
    }
}
    """
  Scenario: Login with valid username and password
    Given url baseUrl+'/api/v1/login'
    And header Authorization = "Bearer " + authToken
    And form field username = "azisss"
    And form field password = "Coba@123"
    When method POST
    Then status 200
    Then match response == expectedResult

  Scenario: Login with Invalid username
    Given url baseUrl+'/api/v1/login'
    And header Authorization = "Bearer " + authToken
    And form field username = "aziss"
    And form field password = "Coba@123"
    When method POST
    Then status 202
    Then match response == expectedResultNegativeCase

