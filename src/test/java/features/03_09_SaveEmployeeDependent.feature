Feature: Save Employee Dependent
  Background:

    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def requestBody =
    """
    {
    "id" : 113,
    "name" : "Mawar",
    "relationship" : "Other",
    "dob" : "1997-03-25"
}
    """

  Scenario: Save an Employee Dependent
    Given url baseUrl+'/api/v1/employee/113/dependent'
    And header Authorization = "Bearer " + authToken
    And request requestBody
    When method POST
    Then status 200
    Then match response.success == 'Successfully Saved'
    * def sequenceNumber = response.sequenceNumber
    * print sequenceNumber


