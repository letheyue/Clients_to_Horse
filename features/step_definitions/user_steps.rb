require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

Given(/^I am in home page of Clients_to_Horse app$/) do
    visit root_path
end
When(/^I follow "Sign up now!" link$/) do 
    click_link('Sign up now!')
end
When(/^I fill the user's information$/) do 
    fill_in('Name', :with => "test1")
    fill_in('Email', :with => "test1@gmail.com")
    fill_in('Password', :with => "123456")
    fill_in('Confirmation', :with => "123456")
end
Then(/^I should see "test1" in profile page$/) do
    click_button('Create my account')
    if page.respond_to? :should
      page.should have_content("test1")
    else
      assert page.has_content?("test1")
    end
end



