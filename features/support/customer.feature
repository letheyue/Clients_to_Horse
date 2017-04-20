Feature: view each customer's information 
As a user of this app
So that I could enter the customer's database through profile page
I want to view each customer's detail information

Background: Log in and create/delete a new owner
  Given I'm on the profile page
  And I enter the Customer database
  And I create a new owner
  Then I could see "test_owner was successfully created."
  When I follow the "Delete" button
  Then I could see "Customer 'test_owner' deleted."
# 1
Scenario: view the detail information of owner
  When I follow the "test1" link
  Then I could see her email
# 2  
Scenario: edit/delete/search a new owner
  Given I'm on the customer page
  When I follow the "Edit" link 
  And I change the address 
  Then I could see "test1 was successfully updated."
  When I click "delete" of "test1"
  Then I could see "Customer 'test1' deleted."
  When I enter a owner's name 
  Then I could see "wonderwoman@gmail.com"
# 3
Scenario: create/edit/delete/search a new horse 
  Given I'm back to profile page
  And I follow the "Horses List" link
  And I follow the "New Horse" link
  When I fill in the new horse's information
  Then I could see "test_horse was successfully created."
  When I edit the horse's age to "1"
  Then I could see "test_horse was successfully updated."
  When I click "Delete test_horse"
  Then I could see "Horse test_horse deleted."
  When I enter a horse's name 
  Then I could see "Red"
  
# 4  
Scenario: create/edit/delete a new activity 
  Given I enter the activities database
  And I follow the "New Activity" link
  When I fill in the new activity's information
  Then I see this new activity
  Then I click the "Edit ICSI"
  Then I change the comment
  And I click "Update Activity Info"
  Then I see "ICSI was successfully updated."
  When I click the "Delete ICSI"
  Then I could see "Activity 'ICSI' deleted."
# 5
Scenario: create/delete a new procedure 
  Given I follow the "Procedures" link
  And I follow the "New procedures" link
  And I fill in the "Name" with "test_procedure"
  When I click "Delete" fo the new procedure
  Then I could see "Procedure 'test_procedure' deleted."
# 6
Scenario: add/edit/delete activities to a new procedure
  Then I click the "Edit" link of the first procedure
  And I arrange the ICSI into the procedure 
  Then I could see "ICSI was successfully created."
  And I arrange the Maturation into the procedure
  Then I could see "Maturation was successfully created."
  And I click "delete" of ICSI
  Then I couldn't see ICSI
# 7 
Scenario: check each horse's owner and arrange a procedure to it
  Given I come to the horse database and choose the first horse
  And I follow the link in the Owner field to check its owner
  Then I add a procedure for this horse
  Then I could see the attached procedure
  When I delete the first activity
# 8 
Scenario: check daily activities through calendar
  Given I enter the calendar page
  When I choose the day of "19th"
  And I could see "Nothing to do"
  When I log out
  Then I could not enter the calendar page
  

  