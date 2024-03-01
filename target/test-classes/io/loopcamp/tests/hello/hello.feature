
 Feature: Hello world feature

  Scenario: User is able to see hello world greeting
#   Given url 'https://sandbox.api.service.nhs.uk/hello-world/hello/world'
   Given url hello_world_api_url
   When method get
   Then status 200

   # Verify JSON response body
   # response.path("message") -- ? Hello World!
  And match response.message == 'Hello World!'


   # How can we verify header
   And match header Content-Type == 'application/json; charset=UTF-8'
   And match header Content-Length == '32'