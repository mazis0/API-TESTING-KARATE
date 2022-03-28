Feature: Save Employee Job Detail
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
        "joinedDate": "2022-03-03",
        "startDate": "2023-04-03",
        "endDate": null

}
    """

  Scenario: Save Employee Job Detail
    Given url baseUrl+'/api/v1/employee/113/job-detail'
    And header Authorization = "Bearer " + authToken
    And request responseBody
    When method POST
    Then status 200
    Then match response.success == 'Successfully Saved'