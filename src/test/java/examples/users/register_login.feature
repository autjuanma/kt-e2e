@author:Masha-Juan
Feature: Register and Login

Background:
  * url baseUrl


@register
Scenario: should register a user successfully
  * def newUser  = read('file:data/input/register-user.json')
  Given path '/api/register'
  And request newUser 
  When method post
  Then status 200
  And match response contains { "id": 4, "token": "QpwL5tke4Pnpja7X4" } 

@unsuccessful 
Scenario: should not register a user without password
* def invalidUser   = { "email": "sydney@fife" }
Given path '/api/register'
And request invalidUser  
When method post
Then status 400
And match response contains { "error": "Missing password" }


@Loginsuccessful
Scenario: should login a user successfully
  * def loginUser  = read('file:data/input/register-user.json')
  Given path '/api/login'
  And request loginUser 
  When method post
  Then status 200
  * def tokenResponse = response
  * def token = tokenResponse.token
  * print 'Token: ', token
  * def tokenJson = { token: '#(token)' }
  * def filePath = 'file:data/output/token.json'
  * def jsonString = JSON.stringify(tokenJson, null, 2)  // Convert data to pretty-printed JSON
  * karate.write(jsonString, filePath)  // Write the JSON string to the file


@Loginsuccessful2
Scenario: should login a user successfully write file
  * def loginUser  = read('file:data/input/register-user.json')
  Given path '/api/login'
  And request loginUser 
  When method post
  Then status 200
  * def tokenResponse = response
  * print('Token Response: ', tokenResponse)
  * def token = tokenResponse.token
  * print('Token: ', token)
  * def tokenJson = karate.set('token', token)
  * def filePath = 'file:data/output/token.json'
  * def jsonString = JSON.stringify(tokenJson, null, 2)  // Convert data to pretty-printed JSON
  * print('JSON String: ', jsonString)
  * karate.write(jsonString, filePath)  // Write the JSON string to the file

