Feature: view each horse's information 
As a user of this app
So that I could enter the horse database through profile page
I want to view each horse's detail's information

Scenario: log in using default user and search for horse/owner and view calendar
   Given I'm on the home page
   And I follow the "Log in" link
   When I fill in user's email and password
   Then I should see "admin" in the profile page
   When I text a horse's name 
   Then I could see its breed

Scenario: without log in visiting page
   Given I'm on the home page and log out 
   When I want to enter the horse database
   Then I could see "Please log in."
   When I want to enter the owner database
   Then I would see "Please log in."
   When I want to enter the activity database
   Then I will see "Please log in."
   When I want to enter the procedure database 
   Then I am going to see "Please log in."
   When I want to enter the chain database
   Then I can see "Please log in."
   When I want to reset the user's information
   Then I am able to see "Please log in."
   When I want to see the calendar
   Then I see "Please log in."
   When I want to see the horse activity
   Then I can look "Please log in."
   When I want to upload or download files
   Then I could look "Please log in."
   When I want to generate the invoice file
   Then I will look "Please log in."



