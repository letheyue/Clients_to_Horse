Feature: sign up and log in 
As a user of this app
So that I can see a sign up bottom in the home page
I want to create my account and my user name will appear on the user home page

Background: the home page has a sign up bottom and a user database 

Scenario: sign up a new user
    Given I am in home page of Clients_to_Horse app
    And I follow "Sign up now!" link
    When I fill the user's information
    Then I should see "test1" in profile page
    
