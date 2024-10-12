Feature: sample karate api testing

Background:
  * url baseUrl

@e2e
Scenario: should return all users
  Given path '/api/users'
  When method get
  Then status 200
  And match $.data[*].first_name contains "George","Janet","Emma","Eve"

@masha
Scenario: should return all users and save to file
  Given path '/api/users'
  When method get
  Then status 200
  And match $.data[*].first_name contains "George", "Janet", "Emma", "Eve"
  * def users = response.data  // Store the response data in a variable
  * def filePath = 'data/output'  // Specify the file path
  * karate.write(users, filePath)  // Write the response data to the file

@e2e
Scenario: should return a single user
  Given path '/api/users/2'
  When method get
  Then status 200
  And match $.data.first_name == "Janet"

@e2e
Scenario: should return users with pagination
  Given path '/api/users?page=2'
  When method get
  Then status 200
  And match $.data[*].first_name contains "Michael", "Tobias"  // Adjust based on actual response