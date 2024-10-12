Feature: sample karate api testing

Background:
  * url baseUrl

@e2e
Scenario: should return all users
  Given path '/api/users'
  When method get
  Then status 200
  And match $.data[*].first_name contains "George","Janet","Emma","Eve"