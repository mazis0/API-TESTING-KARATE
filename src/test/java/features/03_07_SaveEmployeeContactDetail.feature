Feature: Save Employee Contact Detail
  Background:

    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def requestBody =
    """
    {
        "id": 113,
        "addressStreet1": "Julang",
        "addressStreet2": "Sukatani",
        "city": "Serang",
        "state": "Cikande",
        "zip": "1111",
        "country": "INDONESIA",
        "homeTelephone": "0213456789",
        "workTelephone": "0231456789",
        "mobile": "081315128207",
        "workEmail": "azis.qa@cilsy.id",
        "otherEmail": "muhammadajis441@gmail.com"
    }
    """

  Scenario: Save an Employee Contact Detail
    Given url baseUrl+'/api/v1/employee/113/contact-detail'
    And header Authorization = "Bearer " + authToken
    And request requestBody
    When method POST
    Then status 200
    Then match response.success == 'Successfully Saved'