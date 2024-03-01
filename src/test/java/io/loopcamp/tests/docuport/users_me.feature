Feature: Adviser user get info

  Background:
    * url docuport_base_url

  #
  Scenario: Adviser user get info /api/v1/identity/users/me
      # By using call read (filePathWithName.feature) method we can read all the properties of that file
      # This will fail because of the file path not being correct TODO: needs to be fixed
      * def login = call read('login.feature')
      * print "Access Token from other file: " + login.token


      Given header Accept = "application/json"
      And header Authorization =  "Bearer " + login.token
      And path "/api/v1/identity/users/me"
      When method get
      Then status 200






