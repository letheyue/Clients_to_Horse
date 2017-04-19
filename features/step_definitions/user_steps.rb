require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

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



