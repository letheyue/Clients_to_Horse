Feature: view each horse's information 
As a user of this app
So that I could enter the horse database through profile page
I want to view each horse's detail's information

Scenario: log in using default user
   Given I'm on the home page
   And I follow the "Log in" link
   When I fill in user's email and password
   Then I should see "admin" in the profile page
    
