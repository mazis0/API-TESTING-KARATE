Feature: Employee Contact Detail
  Background:

    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def expectedResult = read('resultEmployeeContactDetail.json')
    * def requestBody =
    """
    {
    "id" : "113"
    }
    """

  Scenario: Get Employee Contact Detail
    Given url baseUrl+'/api/v1/employee/113/contact-detail'
    And header Authorization = "Bearer " + authToken
    And request requestBody
    When method GET
    Then status 200
    Then match response == expectedResult