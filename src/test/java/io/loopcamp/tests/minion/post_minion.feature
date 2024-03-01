Feature: Add new minion

  Background:
    * url minion_base_url

    Scenario: Post new minion
      Given header Accept = "application/json"
      # Since I am doing POST request meaning sending a data in the request body, I need to tell Server that in what format I am sending
      And header Content-Type = "application/json"
      # OPTION 1 - We can assign the request body as a String into a variable and use it.
      #* def reqBody =
      #        """
      #        {
      #          "gender": "Male",
      #          "name": "Post3",
      #          "phone":'7032226677'
      #        }
      #        """
      # Now we can use this variable as part of our request.
      # And request reqBody

      # OPTION 2 -
      And request {"gender": "Male", "name": "Karate", "phone": '7032226677'}
      And path "/minions"
      And method post
      Then status 201








      # How can we validate the data type -- > response.path(data.id) --- > 302
      And match response.data.id == '#number'

      * def minionId = response.data.id
      * print "Newly generate Minion ID: " + minionId
      # After posting, can you verify if the posted info with API
      Given header Accept = "application/json"
      And path "/minions/" + minionId
      When method get
      Then status 200

      # Validate the body if matches
      # How can we pass the variable name as part of the validation: the syntax is: '#(minionId)'--> here the minionId is the variable name
      And match response == {id: '#(minionId)', gender: "Male", name: "Karate", phone: "7032226677"}


      # Can we delete it after we do the testing
      Given path "/minions/", minionId
      And method delete
      Then status 204





