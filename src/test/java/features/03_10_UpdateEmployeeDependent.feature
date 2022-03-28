Feature: Update Employee Dependent
  Background:

    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def requestBody =
    """
    {
    "id" : 113,
    "name" : "Mawar",
    "relationship" : "Child",
    "dob" : "1997-04-15",
    "sequenceNumber" : "1"
    }
    """

  Scenario: Update an Employee Dependent
    Given url baseUrl+'/api/v1/employee/113/dependent'
    And header Authorization = "Bearer " + authToken
    And request requestBody
    When method PUT
    Then status 200
    Then match response.success == 'Successfully Updated'