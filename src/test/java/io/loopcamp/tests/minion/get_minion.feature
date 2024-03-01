Feature: Minion Rest API: get minion test

  Background:
    Given url minion_base_url

  Scenario: Get all minions with PATH PARAM
    # This how we do the Accept = 'application/json' in reqeust header in KARATE
    Given header Accept = "application/json"
    # This is how we do the PATH PARAM in KARATE
    And path "/minions"
    When method GET
    Then status 200
    And match header Content-Type == "application/json"
    # How we can print -- > response.prettyPrint()
    And print response



    Scenario: Get single minion and verify data/body
      Given header Accept = 'application/json'
      And path "/minions/20"
      When method GET
      #Checking the response for header and the body and status code
      Then status 200
      And match header Content-Type == 'application/json'
      # And print response
      # response.path("id")
      And match response.id == 20
      And match response.gender == 'Male'
      And match response.name == 'Lothario'
      # you can use assert as well but need to be careful some tomes match is better approach
      And assert response.phone == '7551551687'

      #Can you verify whole these in ONE statement - YES, of course
      And match response == {id: 20, gender: 'Male', name: 'Lothario', phone: '7551551687'}


      # How can we declare our own variable
      # int id = response.patch("id"); --- >  20
      # for concatenation, we can use + or ,
      * def minionId = response.id
      * print "Minion ID: " + minionId
      * print "Minion ID: ",minionId

      # using variable for the assertion
      And match minionId == 20





