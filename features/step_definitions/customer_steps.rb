require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

Given(/^I create a new user$/) do
    visit root_path
    click_link('Sign up now!')
    fill_in('Name', :with => "test1")
    fill_in('Email', :with => "test1@gmail.com")
    fill_in('Password', :with => "123456")
    fill_in('Confirmation', :with => "123456")
    click_button('Create my account')
end
Given(/^I enter the Customer database$/) do
    click_link('Home')
    click_link('Profile')
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

Then(/^I could see "I could see test_owner was successfully created."$/) do
  if page.respond_to? :should
    page.should have_content('test_owner was successfully created.')
  else
    assert page.has_content?('test_owner was successfully created.')
  end
end

When(/^I follow the "Delete" button$/) do
    click_button('Delete')
end
Then(/^I could see "Customer 'test_owner' deleted."$/) do
  if page.respond_to? :should
    page.should have_content("Customer 'test_owner' deleted.")
  else
    assert page.has_content?("Customer 'test_owner' deleted.")
  end
end

When(/^I follow the "test_owner" link$/) do
    click_link('test_owner')
end
Then(/^I could see his email$/) do
  if page.respond_to? :should
    page.should have_content("test_owner@gmail.com")
  else
    assert page.has_content?("test_owner@gmail.com")
  end
end

Given(/^I'm on the customer page$/) do
    visit owners_path
end
When(/^I follow the "Edit" link$/) do
    click_button('Edit')
end
Then(/^I change the address$/) do
    fill_in('Address', :with =>"111")
    click_button('Update Owner Info')
end
Then(/^I could see "test_owner was successfully updated."$/) do
  if page.respond_to? :should
    page.should have_content("test_owner was successfully updated.")
  else
    assert page.has_content?("test_owner was successfully updated.")
  end
end



Given(/^I enter "test_owner"$/) do
    visit owners_path
    click_link('test_owner')
end
Then(/^I fill in the "amount" with "100"$/) do
    fill_in('amount', :with =>"100")
end
Then(/^click "Make a payment"$/) do
    click_button('Make a payment')
end
Then(/^I could see "-100 USD"$/) do
  if page.respond_to? :should
    page.should have_content("-100 USD")
  else
    assert page.has_content?("-100 USD")
  end
end
Then(/^I follow "Billing Summary" link$/) do
    click_link('Billing Summary')
end
Then(/^I could see the payment$/) do
  if page.respond_to? :should
    page.should have_content("Balance")
  else
    assert page.has_content?("Balance")
  end
  if page.respond_to? :should
    page.should have_content("-100")
  else
    assert page.has_content?("-100")
  end
end
Then(/^I could go back to the customer$/) do 
    click_link('Back to customer detail')
    if page.respond_to? :should
      page.should have_content("Details about Customer")
    else
      assert page.has_content?("Details about Customer")
    end
end

Given(/^I step back to the home page$/) do
    visit root_path
end
Then(/^I follow the "Log in" link$/) do 
    click_link('Log out')
    click_link('Log in')
end
When(/^I fill in user's email and password$/) do 
    fill_in('Email', :with => "test1@gmail.com")
    fill_in('Password', :with => "123456")
end
Then (/^I should see "test1" in the profile page$/) do 
  click_button('Log in')
  if page.respond_to? :should
    page.should have_content('test1')
  else
    assert page.has_content?('test1')
  end
end

Given(/^I click the "Home" link$/) do
    click_link('Home')
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
    select('test_owner', :from => 'Owner')
end
Then (/^I could see "test_horse was successfully created."$/) do 
  click_button('Save')
  if page.respond_to? :should
    page.should have_content('test_horse was successfully created.')
  else
    assert page.has_content?('test_horse was successfully created.')
  end
end