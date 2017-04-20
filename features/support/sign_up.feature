Feature: view each horse's information 
As a user of this app
So that I could enter the horse database through profile page
I want to view each horse's detail's information

Scenario: log in using default user and search for horse/owner
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