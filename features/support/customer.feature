Feature: view each customer's information 
As a user of this app
So that I could enter the customer's database through profile page
I want to view each customer's detail information

Background: Sign up before every scenarios 
  Given I create a new user
  And I enter the Customer database
  And I create a new owner
 

Scenario: create and delete a new owner 
  Then I could see "I could see test_owner was successfully created."
  When I follow the "Delete" button
  Then I could see "Customer 'test_owner' deleted."
  
Scenario: view the detail information of owner
  When I follow the "test_owner" link
  Then I could see his email
  
Scenario: edit a new owner
  Given I'm on the customer page
  When I follow the "Edit" link 
  And I change the address 
  Then I could see "test_owner was successfully updated."

Scenario: make a payment and check the billing history
  Given I enter "test_owner"
  And I fill in the "amount" with "100"
  And click "Make a payment" 
  Then I could see "-100 USD"
  And I follow "Billing Summary" link 
  Then I could see the payment 
  And I could go back to the customer
  
Scenario: create a new horse 
  Given I click the "Home" link
  And I follow the "Horses List" link
  And I follow the "New Horse" link
  When I fill in the new horse's information
  Then I could see "test_horse was successfully created."