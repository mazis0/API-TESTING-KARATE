Feature: Update Employee Job Detail
  Background:

    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def responseBody =
    """
    {
        "id" : 113,
        "title": "",
        "category": null,
        "status": "",
        "subunit": "",
        "location": "",
        "joinedDate": "2023-03-03",
        "startDate": "2024-04-03",
        "endDate": null

}
    """

  Scenario: Update Employee Job Detail
    Given url baseUrl+'/api/v1/employee/113/job-detail'
    And header Authorization = "Bearer " + authToken
    And request responseBody
    When method PUT
    Then status 200
    Then match response.success == 'Successfully Saved'