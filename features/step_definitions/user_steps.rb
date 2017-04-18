require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

Given(/^I'm on the home page$/) do
    visit root_path
end
When(/^I follow the "Sign up" link$/) do 
    click_link('Sign up now!')
end
When(/^I fill in the user's information$/) do 
    fill_in('Name', :with => "test1")
    fill_in('Email', :with => "test1@gmail.com")
    fill_in('Password', :with => "123456")
    fill_in('Confirmation', :with => "123456")
    click_button('Create my account')
end

