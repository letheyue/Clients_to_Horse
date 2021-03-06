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
    fill_in('Name', :with => "a_test_owner")
    fill_in('Email', :with => "test_owner@gmail.com")
    fill_in('Phone_number', :with => "9794027350")
    fill_in('Fax_number', :with => "123456")
    fill_in('Address', :with => "1601 Holleman Drive")
    fill_in('Comments', :with => "None")
    click_button('Save')
end
Then(/^I could see "a_test_owner was successfully created."$/) do
  if page.respond_to? :should
    page.should have_content('a_test_owner was successfully created.')
  else
    assert page.has_content?('a_test_owner was successfully created.')
  end
end

When(/^I follow the "Delete" button$/) do
  click_link('Back to customers list')
  click_button('Delete', match: :first)
end
Then(/^I could see "Customer 'a_test_owner' deleted."$/) do
  if page.respond_to? :should
    page.should have_content("deleted.")
  else
    assert page.has_content?("deleted.")
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
    page.should have_content("successfully updated.")
  else
    assert page.has_content?("successfully updated.")
  end
end
When(/^I click "delete" of "test1"$/) do
    visit owners_path
    click_button('Delete', match: :first)
end
Then (/^I could see "Customer 'test1' deleted."$/) do 
  if page.respond_to? :should
    page.should have_content("deleted.")
  else
    assert page.has_content?("deleted.")
  end
end
When(/^I enter a owner's name$/) do 
    fill_in("Search owner's name or address or email or comments or phone or fax", :with => "Dianna Prince")
    click_button('Search')
end
Then (/^I could see "wonderwoman@gmail.com"$/) do 
  if page.respond_to? :should
    page.should have_content('wonderwoman@gmail.com')
  else
    assert page.has_content?('wonderwoman@gmail.com')
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
When(/^I edit the horse's age to "1"$/) do 
    click_button('Edit test_horse')
    fill_in('Age', :with => "1")
    click_button('Update Horse Info')
end
Then (/^I could see "test_horse was successfully updated."$/) do 
  if page.respond_to? :should
    page.should have_content('test_horse was successfully updated.')
  else
    assert page.has_content?('test_horse was successfully updated.')
  end
end
When(/^I click "Delete test_horse"$/) do
    click_link('Back to horses list')
    click_button('Delete test_horse')
end
Then (/^I could see "Horse test_horse deleted."$/) do 
  if page.respond_to? :should
    page.should have_content('Horse test_horse deleted.')
  else
    assert page.has_content?('Horse test_horse deleted.')
  end
end
When(/^I enter a horse's name$/) do 
    fill_in("Search horse's name or age or sex or breed", :with => "Curry")
    click_button('Search')
end
Then (/^I could see "Red"$/) do 
  if page.respond_to? :should
    page.should have_content('Red')
  else
    assert page.has_content?('Red')
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
When(/^I click the "Edit Additional embryo vitrified concurrently"$/) do
    click_button('Edit', match: :first)
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
Then (/^I see "Additional embryo vitrified concurrently was successfully updated."$/) do
  if page.respond_to? :should
    page.should have_content('Additional embryo vitrified concurrently was successfully updated.')
  else
    assert page.has_content?('Additional embryo vitrified concurrently was successfully updated.')
  end
end
When(/^I click the "Delete Additional embryo vitrified concurrently"$/) do
    click_button('Delete', match: :first)
end
Then(/^I could see "Activity 'Additional embryo vitrified concurrently' deleted."$/) do
  if page.respond_to? :should
    page.should have_content("Activity 'Additional embryo vitrified concurrently' deleted.")
  else
    assert page.has_content?("Activity 'Additional embryo vitrified concurrently' deleted.")
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
Then(/^I fill in the "Name" with "aatest_procedure"$/) do
    fill_in('Name', :with => "aatest_procedure")
    click_button('Add')
    click_link('Back to procedures list')
end
When(/^I click "Delete" fo the new procedure$/) do
  visit procedures_path
  click_button('Delete', match: :first)
end
Then(/^I could see "Procedure 'aatest_procedure' deleted."$/) do
  if page.respond_to? :should
    page.should have_content("deleted.")
  else
    assert page.has_content?("deleted.")
  end
end
##################################################################
# Scenario6
Given(/^I click the "Edit" link of the first procedure$/) do
    visit procedures_path
    click_button('Edit', match: :first)
  if page.respond_to? :should
    page.should have_content("Additional embryo vitrified concurrently")
  else
    assert page.has_content?("Additional embryo vitrified concurrently")
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
    page.should have_no_content('apple')
  else
    assert page.has_no_content?('apple')
  end
end
##################################################################
# Scenario7
Given(/^I come to the horse database and choose the first horse$/) do
    click_link('Profile')
    click_link('Horses List')
    click_link('Curry')
end
Then(/^I follow the link in the Owner field to check its owner$/) do
    click_link('test1')
    if page.respond_to? :should
      page.should have_content('test1')
    else
      assert page.has_content?('test1')
    end
end
When(/^I click the "Curry" and make the first activity done$/) do
    visit horses_path
    click_link('Curry')
    check(status, match: :first)
    click_button('Update')
end
Then(/^I could see "activities were successfully updated."$/) do
    if page.respond_to? :should
      page.should have_content('activities were successfully updated.')
    else
      assert page.has_content?('activities were successfully updated.')
    end
end
Then(/^I follow the "Completed Activities" link and I could see "Day 5 Cleavage Check"$/) do
    click_link('Completed Activities')
    if page.respond_to? :should
      page.should have_content('Day 5 Cleavage Check')
    else
      assert page.has_content?('Day 5 Cleavage Check')
    end
end
Then(/^I could go back to the horse page$/) do
    click_link('Back to horse')
    if page.respond_to? :should
      page.should have_content('Curry')
    else
      assert page.has_content?('Curry')
    end
end
Then(/^I could see "50 USD" in its owner billing$/) do
    click_link('test1')
    if page.respond_to? :should
      page.should have_content('$50.0')
    else
      assert page.has_content?('$50.0')
    end
end
When(/^the owner pay "50 USD"$/) do
    click_link('Billing Summary')
    fill_in('amount', :with =>'50',match: :first)
    fill_in('comment', :with =>'pay',match: :first)
    click_button('Make a credit')
end
Then(/^the billing should be "0 USD"$/) do
    if page.respond_to? :should
      page.should have_content('$0.0')
    else
      assert page.has_content?('$0.0')
    end
end
Then(/^I could check my month balance in "Billing Summary"$/) do
    if page.respond_to? :should
      page.should have_content('Total Balance')
    else
      assert page.has_content?('Total Balance')
    end
    click_link('Expense')
    if page.respond_to? :should
      page.should have_content('$50.0')
    else
      assert page.has_content?('$50.0')
    end
    click_link('Credit')
    if page.respond_to? :should
      page.should have_content('$-50.0')
    else
      assert page.has_content?('$-50.0')
    end
    click_link('<<')
    if page.respond_to? :should
      page.should have_content('Monthly Balance : $0.0')
    else
      assert page.has_content?('Monthly Balance : $0.0')
    end
    click_link('>>')
    if page.respond_to? :should
      page.should have_content('Total Balance: $0.0')
    else
      assert page.has_content?('Total Balance: $0.0')
    end
end
When(/^I click Send Invoice$/) do 
    click_button('Send Invoice')
end
Then(/^I fill in subject with invoice and press send$/) do
    fill_in('subject', :with =>"invoice")
    click_button('Send')
end 
Then(/^I come back to the billing summary page$/) do
    if page.respond_to? :should
      page.should have_content("To: test1 <letheyuetemp@gmail.com>")
    else
      assert page.has_content?("To: test1 <letheyuetemp@gmail.com>")
    end
end
When(/^I want to send email$/) do 
    click_link('Back to customer detail')
    click_button('Send Mail')
end
Then(/^I would see the owner's email address$/) do
    if page.respond_to? :should
      page.should have_content("Billing Summary")
    else
      assert page.has_content?("Billing Summary")
    end
end
When(/^I complete the content and send it$/) do
    fill_in('subject', :with =>'test')
    click_button('Send')
    if page.respond_to? :should
      page.should have_content("Details about Customer")
    else
      assert page.has_content?("Details about Customer")
    end
end
Then(/^I could delete the payment history$/) do
    click_link('Billing Summary')
    click_link('delete', match: :first)
    if page.respond_to? :should
      page.should have_no_content('-100')
    else
      assert page.has_no_content?('-100')
    end
    click_link('Back to customer detail')
    click_link('Curry')
    click_link('Back to horses list')
    if page.respond_to? :should
      page.should have_content('Horses Information')
    else
      assert page.has_content?('Horses Information')
    end
end
Then(/^I add a procedure for this horse$/) do
     visit horses_path
     click_link('Curry')
     click_link('Add Procedure')
     click_link('Add', match: :first)
     if page.respond_to? :should
       page.should have_content('ICSI')
     else
       assert page.has_content?('ICSI')
     end
     # select('2017', :from => 'date_year')
     # select('April', :from => 'date_month')
     # select('20', :from => 'date_day')
 end

# Then(/^I could see the attached procedure$/) do
#     click_button('Add Procedure')
#     if page.respond_to? :should
#       page.should have_content('In-Vivo Oocytes')
#     else
#       assert page.has_content?('In-Vivo Oocytes')
#     end
# end
# When(/^I delete the first activity$/) do
#     click_button('delete', match: :first)
#     if page.respond_to? :should
#       page.should have_content('activities were successfully deleted.')
#     else
#       assert page.has_content?('activities were successfully deleted.')
#     end
# end
##################################################################
# Scenario8
Given(/^I enter the calendar page$/) do
    click_link('Calendar')
end
When(/^I choose the day of "19th"$/) do
    click_link('19')
end
Then(/^I could see "Nothing to do"$/) do
    if page.respond_to? :should
      page.should have_content('Nothing to do')
    else
      assert page.has_content?('Nothing to do')
    end
end
When(/^I choose the day of "22th"$/) do
    click_link('22')
end
Then(/^I could click the first activity$/) do
    check(status, match: :first)
    click_button('Update')
end
Then(/^I could see "done"$/) do
    if page.respond_to? :should
      page.should have_content("done")
    else
      assert page.has_content?("done")
    end
end
When(/^I log out$/) do
    click_link('Log out')
end
Then(/^I could not enter the calendar page$/) do
    visit calendars_show_path
    if page.respond_to? :should
      page.should have_content("Please log in.")
    else
      assert page.has_content?("Please log in.")
    end
end
##################################################################
# Scenario9
Given(/^I step into the owner's page$/) do
    click_link('Profile')
    click_link('Customers List')
    click_link('test1')
end
When(/^I click the link "Add Document"$/) do
    click_button('Add Document')
end
Then(/^I choose a file and write a description and click "Update"$/) do
    attach_file(:doc_file_name, File.join('app','assets','images','homepage1.png'))
    fill_in('doc_description', :with =>'this is the test file')
    click_button('Upload')
end
Then(/^I could see the document in the owner's page$/) do
    if page.respond_to? :should
      page.should have_content("Documents:	1")
    else
      assert page.has_content?("Documents:	1")
    end
    if page.respond_to? :should
      page.should have_content("this is the test file")
    else
      assert page.has_content?("this is the test file")
    end
end
Then(/^I click this document$/) do
    click_link('homepage1.png')
    if page.respond_to? :should
      page.should have_content("File Name: homepage1.png")
    else
      assert page.has_content?("File Name: homepage1.png")
    end
end
Then(/^I could do some procedures about this document$/) do
    click_link("Back to Owner's Page")
    if page.respond_to? :should
      page.should have_content("Details about Customer")
    else
      assert page.has_content?("Details about Customer")
    end
end
When(/^I add the same file to the owner$/) do
    click_button('Add Document')
    attach_file(:doc_file_name, File.join('app','assets','images','homepage1.png'))
    click_button('Upload')
end
Then(/^I could see "A document with the same name is attached to this owner!"$/) do
    if page.respond_to? :should
      page.should have_content("A document with the same name is attached to this owner!")
    else
      assert page.has_content?("A document with the same name is attached to this owner!")
    end
end
When(/^I click the "delete" button$/) do
    click_link('Delete')
end

Then(/^the number turns to zero$/) do
    if page.respond_to? :should
      page.should have_content("Documents:	0")
    else
      assert page.has_content?("Documents:	0")
    end
end
When(/^I enter the detail information of horse curry$/) do
    visit horses_path
    click_link('Curry')
end
Then(/^I click the Add Document$/) do
    click_button('Add Document')
end
When(/^I fill in nothing and press Upload$/) do
    click_button('Upload')
end
Then(/^I could see Invalid name for the document$/) do
    if page.respond_to? :should
      page.should have_content("Invalid name for the document")
    else
      assert page.has_content?("Invalid name for the document")
    end
end