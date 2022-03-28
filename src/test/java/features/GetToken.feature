
Feature: Token

  Scenario: Invalid client_id while get token
    Given url baseUrl+'/oauth/issueToken'
    And form field grant_type = 'client_credentials'
    And form field client_id = 'azis'
    And form field client_secret = 'smallproject3'
    When method POST
    Then status 200
    * def jsonData = response
    * def error = jsonData.error
    Then match error == 'invalid_client'
    * def error_description = jsonData.error_description
    Then match error_description == 'The client credentials are invalid'

  Scenario: Get Token
    Given url baseUrl+'/oauth/issueToken'
    And form field grant_type = 'client_credentials'
    And form field client_id = 'azisss'
    And form field client_secret = 'smallproject3'
    When method POST
    Then status 200
    * print response
    * def jsonData = response
    * print jsonData
    * def AccessToken = jsonData['access_token']
    * print AccessToken
    * def token_type = jsonData.token_type
    Then match token_type == 'Bearer'
    * def scope = jsonData.scope
    Then match scope == 'admin'
