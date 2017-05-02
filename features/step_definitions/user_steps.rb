require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

##################################################################
# Scenario1
Given(/^I'm on the home page$/) do
    visit root_path
end
When(/^I follow the "Log in" link$/) do 
    click_link('Log in')
end
When(/^I fill in user's email and password$/) do 
    fill_in('Email', :with => "test@sample.com")
    fill_in('Password', :with => "123456")
end
Then(/^I should see "admin" in the profile page$/) do
    click_button('Log in')
    if page.respond_to? :should
      page.should have_content("admin")
    else
      assert page.has_content?("admin")
    end
end
When(/^I text a horse's name$/) do 
    fill_in("Search horse's name or age or sex or breed", :with => "Curry")
    click_button('Search', match: :first)
end
Then(/^I could see its breed$/) do
    if page.respond_to? :should
      page.should have_content("Red")
    else
      assert page.has_content?("Red")
    end
end
##################################################################
# Scenario2
Given(/^I'm on the home page and log out$/) do
    visit root_path
end
When(/^I want to enter the horse database$/) do
    visit horses_path
end
Then(/^I could see "Please log in."$/) do
    if page.respond_to? :should
      page.should have_content("Please log in.")
    else
      assert page.has_content?("Please log in.")
    end
end
When(/^I want to enter the owner database$/) do
    visit root_path
    visit owners_path
end
Then(/^I would see "Please log in."$/) do
    if page.respond_to? :should
      page.should have_content("Please log in.")
    else
      assert page.has_content?("Please log in.")
    end
end
When(/^I want to enter the activity database$/) do
    visit root_path
    visit activities_path
end
Then(/^I will see "Please log in."$/) do
    if page.respond_to? :should
      page.should have_content("Please log in.")
    else
      assert page.has_content?("Please log in.")
    end
end
When(/^I want to enter the procedure database$/) do
    visit root_path
    visit procedures_path
end
Then(/^I am going to see "Please log in."$/) do
    if page.respond_to? :should
      page.should have_content("Please log in.")
    else
      assert page.has_content?("Please log in.")
    end
end
When(/^I want to enter the chain database$/) do
  visit root_path
  visit edit_chain_path(:id => '1')
end
Then(/^I can see "Please log in."$/) do
  if page.respond_to? :should
    page.should have_content("Please log in.")
  else
    assert page.has_content?("Please log in.")
  end
end
When(/^I want to reset the user's information$/) do
  visit root_path
  visit edit_user_path(:id => '1')
end
Then(/^I am able to see "Please log in."$/) do
  if page.respond_to? :should
    page.should have_content("Please log in.")
  else
    assert page.has_content?("Please log in.")
  end
  visit edit_password_reset_path(:id => '1')
  if page.respond_to? :should
    page.should have_content("Please log in.")
  else
    assert page.has_content?("Please log in.")
  end
  visit edit_smtp_mail_path(:id => '1')
  if page.respond_to? :should
    page.should have_content("Please log in.")
  else
    assert page.has_content?("Please log in.")
  end
end
When(/^I want to see the calendar$/) do
  visit root_path
  visit calendars_show_path
end
Then(/^I see "Please log in."$/) do
  if page.respond_to? :should
    page.should have_content("Please log in.")
  else
    assert page.has_content?("Please log in.")
  end
end
When(/^I want to see the horse activity$/) do
  visit root_path
  visit horse_activities_path
end
Then(/^I can look "Please log in."$/) do
  if page.respond_to? :should
    page.should have_content("Please log in.")
  else
    assert page.has_content?("Please log in.")
  end
end
When(/^I want to upload or download files$/) do
  visit root_path
  visit owner_add_document_path(:owner_id => '1')
end
Then(/^I could look "Please log in."$/) do
  if page.respond_to? :should
    page.should have_content("Please log in.")
  else
    assert page.has_content?("Please log in.")
  end
end
When(/^I want to generate the invoice file$/) do
  visit root_path
  visit download_invoice_path
end
Then(/^I will look "Please log in."$/) do
  if page.respond_to? :should
    page.should have_content("Please log in.")
  else
    assert page.has_content?("Please log in.")
  end
end
##################################################################
# Scenario3
Given(/^I enter the profile page$/) do
  visit root_path
  click_link('Log in')
  fill_in('Email', :with => "test@sample.com")
  fill_in('Password', :with => "123456")
  click_button('Log in')
end
When(/^I click edit user information$/) do
  click_link('edit user information')  
end
Then(/^I change the user's name to a new one$/) do
  fill_in("name", :with => "admin_1")
  click_button('Update')
end
Then(/^I could see the new name in the profile page$/) do
  if page.respond_to? :should
    page.should have_content("admin_1's information has been reset.")
  else
    assert page.has_content?("admin_1's information has been reset.")
  end
end
When(/^I click change password$/) do
  click_link('change password')
end
Then(/^I fill in the new password$/) do
  fill_in("user[password]", :with =>"1234567")
  fill_in("user[password_confirmation]", :with =>"1234567")
  click_button('Update')
end
Then(/^I could see text Password has been reset.$/) do
  if page.respond_to? :should
    page.should have_content("Password has been reset.")
  else
    assert page.has_content?("Password has been reset.")
  end
end
When(/^I click change smtp mail address$/) do
  click_link('change smtp mail address')
end
Then(/^I fill in the new email address$/) do
  fill_in("smtp_mail", :with =>"test@gmail.com")
  fill_in("smtp_mail_password", :with =>"1234567")
  click_button('Update')
end
Then(/^I could see Smtp mail has been reset.$/) do
  if page.respond_to? :should
    page.should have_content("Smtp mail has been reset.")
  else
    assert page.has_content?("Smtp mail has been reset.")
  end
end
