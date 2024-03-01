Feature: Adviser user gets authorization token

  Background:
    * url docuport_base_url

    Scenario: Adviser user gets token
      Given header Accept = "application/json"
      And header Content-Type = "application/json"
      And request {usernameOrEmailAddress: "b1g1_advisor@gmail.com", password: 'Group1'}
      And path "/api/v1/authentication/account/authenticate"
      When method post
      Then status 200

      # extract the token and store it into a variable
      * def token = response.user.jwtToken.accessToken
      * print "Access Token: " + token






