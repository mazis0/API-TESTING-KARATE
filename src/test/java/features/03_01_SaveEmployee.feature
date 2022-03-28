Feature: Save Employee
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

    "firstName" : "test",
    "middleName" : "and",
    "lastName" : "error324"
    }
    requestBody.code = randomString
    """


  Scenario: Save an Employee
    Given url baseUrl+'/api/v1/employee/113'
    And header Authorization = "Bearer " + authToken
    And request requestBody
    When method POST
    Then status 200
    Then match response.success == 'Successfully Saved'