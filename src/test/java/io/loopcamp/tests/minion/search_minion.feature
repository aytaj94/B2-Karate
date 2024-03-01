Feature: Search minions

  Background:
    * url minion_base_url


    Scenario: Search minion with QUERY PARAM
      Given header Accept = 'application/json'
      # How to add QUERY PARAM
      # In RestAssured -- >  and().queryParam("key", "Value")
      # In RestAssured -- >  and().queryParams("key", "Value", "anotherKey", "anotherValue")
      And param gender = "Female"
      And param nameContains = 'A'
      # And params gender = "Female", nameContains = 'A'
      And path "/minions/search"
      When method GET
      Then status 200
      # Verify header
      And match header Content-Type == "application/json"
      And print response
      And print "Total Element: ",  response.totalElement
      And match response.totalElement == 31

      # Verify the 1st persons name is "Paige",
      * def firstMinionName = response.content[0].name
      And print "First minion name: " + firstMinionName

      # verify if the name has A -  the one below will fail
      # And match firstMinionName contains 'A'
      # But we can use utility class called karate and use lowercase() method
      And match karate.lowerCase(firstMinionName) contains 'a'

      # How can we get all the names
      # And print "All names: " + response.content.name


      # The syntax for [*] --- >  is representing any, It will not work with direct print statements but will work with ASSERTIONS
      # And print "All names: " + response.content[*].name
      #* def allNames =  response.content[*].name
      #* print allNames
      And match response.content[*].name contains 'Lorenza'

      # Can you calidate if multiple values are in the response -- Lorenza, Nona, Jaimie
      And match response.content[*].name contains  ['Lorenza', "Nona", 'Jaimie']

      # Instead of doing it by response keyword, we can use a $  - > which means the starting point of the response body
      * def allNames  =  $.content[*].name
      * print "All Names: ", allNames


      # How would you check if EACH gender is Female
      * def allGenders  =  $.content[*].gender
      * print "All Genders: " + allGenders
      And match each allGenders == 'Female'
      And match each response.content[*].gender == 'Female'



      # How can you check if each name contain "a" or "A" -- > the one below will fail since the reponse comes back with both 'a' and 'A'
      # And match each  response.content[*].name contains "A"

      # And match each karate.lowerCase(response.content[*].name) contains 'a'  -- >  It looks like the Karate does not like that syntax on "match each" -- > so I used the variable
      And match each karate.lowerCase(allNames) contains 'a'




























