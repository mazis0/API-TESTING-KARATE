Feature: Update Employee Contact Detail
  Background:

    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def requestBody =
    """
    {
        "id": 113,
        "addressStreet1": "Julang",
        "addressStreet2": "Sukatani",
        "city": "Karawang",
        "state": "Cikande",
        "zip": "1111",
        "country": "INDONESIA",
        "homeTelephone": "1234567",
        "workTelephone": "0245890",
        "mobile": "08123456789",
        "workEmail": "azis@cilsy.id",
        "otherEmail": "muhammadajis447@gmail.com"
    }
    """

  Scenario: Update an Employee Contact Detail
    Given url baseUrl+'/api/v1/employee/113/contact-detail'
    And header Authorization = "Bearer " + authToken
    And request requestBody
    When method PUT
    Then status 200
    Then match response.success == 'Successfully Updated'