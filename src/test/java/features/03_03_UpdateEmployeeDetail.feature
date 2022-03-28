Feature: Update Employee Detail
  Background:

    * def myFeature = call read('GetToken.feature')
    * def authToken = myFeature.AccessToken
    * def random_string =
    """
    function(s){
    var text = "";
    var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    for(var i=0;i<s;i++)
    text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
    return text;
    }

    """
    * def randomString = random_string(10)
    * print randomString
    * def requestBody =
    """

    {

    "firstName": "Muhammad",
        "middleName": " ",
        "lastName": "Azis",
        "employeeId": "113",
        "dob": "2060-03-27",
        "licenseNumber": "4363263",
        "licenseNumberExpDate": "2027-03-20",
        "maritalStatus": "Married",
        "gender": "M",
        "otherId": "789",
        "nationality": "Indonesian"
}
    requestBody.code = randomString
    """


  Scenario: Update an Employee Detail
    Given url baseUrl+'/api/v1/employee/113'
    And header Authorization = "Bearer " + authToken
    And request requestBody
    When method PUT
    Then status 200
    Then match response.success == 'Successfully Updated'
