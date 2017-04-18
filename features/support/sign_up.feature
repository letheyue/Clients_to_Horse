Feature: view each horse's information 
As a user of this app
So that I could enter the horse database through profile page
I want to view each horse's detail's information

Background: Sign up before every scenarios 
  Given I'm on the home page
  And I follow the "Sign up" link
  And I fill in the user's information
  
Scenario: log in 
  Given I step back to the home page
  And I follow the "Log in" link
  When I fill in user's email and password
  Then I should see "test1" in the profile page
    
