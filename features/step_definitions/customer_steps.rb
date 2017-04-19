require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
##################################################################
# Background
Given(/^I'm on the profile page$/) do
    visit root_path
    click_link('Log in')
    fill_in('Email', :with => "test@sample.com")
    fill_in('Password', :with => "123456")
    click_button('Log in')
end
Given(/^I enter the Customer database$/) do
    click_link('Customers List')
end
When(/^I create a new owner$/) do 
    click_button('New Owner')
    fill_in('Name', :with => "test_owner")
    fill_in('Email', :with => "test_owner@gmail.com")
    fill_in('Phone_number', :with => "9794027350")
    fill_in('Fax_number', :with => "123456")
    fill_in('Address', :with => "1601 Holleman Drive")
    fill_in('Comments', :with => "None")
    click_button('Save')
end
Then(/^I could see "test_owner was successfully created."$/) do
  if page.respond_to? :should
    page.should have_content('test_owner was successfully created.')
  else
    assert page.has_content?('test_owner was successfully created.')
  end
end

When(/^I follow the "Delete" button$/) do
  click_button('Delete', match: :first)
end
Then(/^I could see "Customer 'test_owner' deleted."$/) do
  if page.respond_to? :should
    page.should have_content("Customer 'test_owner' deleted.")
  else
    assert page.has_content?("Customer 'test_owner' deleted.")
  end
end

##################################################################
# Scenario1
When(/^I follow the "test1" link$/) do
    click_link('test1')
end
Then(/^I could see her email$/) do
  if page.respond_to? :should
    page.should have_content("letheyuetemp@gmail.com")
  else
    assert page.has_content?("letheyuetemp@gmail.com")
  end
end
##################################################################
# Scenario2
Given(/^I'm on the customer page$/) do
    visit owners_path
end
When(/^I follow the "Edit" link$/) do
    click_button('Edit', match: :first)
end
Then(/^I change the address$/) do
    fill_in('Address', :with =>"111")
    click_button('Update Owner Info')
end
Then(/^I could see "test1 was successfully updated."$/) do
  if page.respond_to? :should
    page.should have_content("test1 was successfully updated.")
  else
    assert page.has_content?("test1 was successfully updated.")
  end
end
When(/^I click "delete" of "test1"$/) do
    visit owners_path
    click_button('Delete', match: :first)
end
Then (/^I could see "Customer 'test1' deleted."$/) do 
  if page.respond_to? :should
    page.should have_content("Customer 'test1' deleted.")
  else
    assert page.has_content?("Customer 'test1' deleted.")
  end
end
##################################################################
# Scenario3
Given(/^I'm back to profile page$/) do
    click_link('Profile')
end
Then(/^I follow the "Horses List" link$/) do
    click_link('Horses List')
end
When(/^I follow the "New Horse" link$/) do 
    click_button('New Horse')
end
When(/^I fill in the new horse's information$/) do 
    fill_in('Name', :with => "test_horse")
    fill_in('Age', :with => "2")
    fill_in('Sex', :with => "F")
    fill_in('Breed', :with => "Yellow")
    select('test1', :from => 'Owner')
end
Then (/^I could see "test_horse was successfully created."$/) do 
  click_button('Save')
  if page.respond_to? :should
    page.should have_content('test_horse was successfully created.')
  else
    assert page.has_content?('test_horse was successfully created.')
  end
end
##################################################################
# Scenario4
Given(/^I enter the activities database$/) do
    click_link('Profile')
    click_link('Activities')
end
When(/^I follow the "New Activity" link$/) do 
    click_button('New Activity')
end
When(/^I fill in the new activity's information$/) do 
    fill_in('Name', :with => "test_activity")
    fill_in('Price', :with => "1000")
    fill_in('Comment', :with => "test for cucumber")
end
Then (/^I see this new activity$/) do 
  click_button('Add')
  if page.respond_to? :should
    page.should have_content('test_activity')
  else
    assert page.has_content?('test_activity')
  end
end
When(/^I click the "Edit ICSI"$/) do
    click_button('Edit ICSI', match: :first)
  if page.respond_to? :should
    page.should have_content('Price')
  else
    assert page.has_content?('Price')
  end
end
Then(/^I change the comment$/) do
    fill_in('Price', :with =>"100")
end
Then(/^I click "Update Activity Info"$/) do
    click_button('Update Activity Info')
end
Then (/^I see "ICSI was successfully updated."$/) do 
  if page.respond_to? :should
    page.should have_content('ICSI was successfully updated.')
  else
    assert page.has_content?('ICSI was successfully updated.')
  end
end
When(/^I click the "Delete ICSI"$/) do
    click_button('Delete ICSI')
end
Then(/^I could see "Activity 'ICSI' deleted."$/) do
  if page.respond_to? :should
    page.should have_content("Activity 'ICSI' deleted.")
  else
    assert page.has_content?("Activity 'ICSI' deleted.")
  end
end

##################################################################
# Scenario5
Given(/^I follow the "Procedures" link$/) do
    click_link('Profile')
    click_link('Procedures')
end
Then(/^I follow the "New procedures" link$/) do
    click_button('New procedures')
end
Then(/^I fill in the "Name" with "test_procedure"$/) do
    fill_in('Name', :with => "test_procedure")
    click_button('Add')
    click_link('test_procedure')
  if page.respond_to? :should
    page.should have_content('Details about test_procedure')
  else
    assert page.has_content?('Details about test_procedure')
  end
end
When(/^I click "Delete" fo the new procedure$/) do
  visit procedures_path
  click_button('Delete', match: :first)
end
Then(/^I could see "Procedure 'test_procedure' deleted."$/) do
  if page.respond_to? :should
    page.should have_content("Procedure 'test_procedure' deleted.")
  else
    assert page.has_content?("Procedure 'test_procedure' deleted.")
  end
end
##################################################################
# Scenario6
Given(/^I click the "Edit" link of the first procedure$/) do
    visit procedures_path
    click_button('Edit', match: :first)
  if page.respond_to? :should
    page.should have_content("Procedure's name Shipped Immature Oocytes")
  else
    assert page.has_content?("Procedure's name Shipped Immature Oocytes")
  end
end
When(/^I arrange the ICSI into the procedure$/) do
    select('ICSI', :from =>'Activity')
    fill_in('Order', :with => "0")
    fill_in('Comment', :with => "day 0")
    click_button('Add')
end
Then(/^I could see "ICSI was successfully created."$/) do
  if page.respond_to? :should
    page.should have_content('ICSI was successfully created.')
  else
    assert page.has_content?('ICSI was successfully created.')
  end
end
When(/^I arrange the Maturation into the procedure$/) do
    select('Maturation', :from =>'Activity')
    fill_in('Order', :with => "1")
    fill_in('Comment', :with => "day 1")
    click_button('Add')
end
Then(/^I could see "Maturation was successfully created."$/) do
  if page.respond_to? :should
    page.should have_content('Maturation was successfully created.')
  else
    assert page.has_content?('Maturation was successfully created.')
  end
end
When(/^I click "delete" of ICSI$/) do
    click_link('delete', match: :first)
end
Then(/^I couldn't see ICSI$/) do
  if page.respond_to? :should
    page.should have_no_content('day 0')
  else
    assert page.has_no_content?('day 0')
  end
end