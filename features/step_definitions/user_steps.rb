require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

def create_visitor
@visitor ||= { :email => "admin@surveybuilder.com",
:password => "admin123", :password_confirmation => "admin123" }
end
def create_surveytaker
@visitor ||= { :email => "user@surveybuilder.com",
:password => "user1234", :password_confirmation => "user1234" }
end
def create_root
@visitor ||= { :email => "root@surveybuilder.com",
:password => "root1234", :password_confirmation => "root1234" }
end
def find_user
@user ||= User.where(:email => @visitor[:email]).first
end
def create_unconfirmed_user
create_visitor
delete_user
sign_up
visit '/users/sign_in'
end
def create_user
create_visitor
delete_user
@user = User.create(@visitor)
end
def delete_user
@user ||= User.where(:email => @visitor[:email]).first
@user.destroy unless @user.nil?
end
def sign_in
visit '/users/sign_in'
fill_in "user_email", :with => @visitor[:email]
fill_in "user_password", :with => @visitor[:password]
click_button "Log in"
end
### GIVEN ###
Given /^I am not logged in$/ do
visit '/users/sign_in'
end
Given /^root is logged in$/ do
create_root
sign_in
end
Given /^I am logged in$/ do
create_visitor
sign_in
end
Given /^User is logged in$/ do
visit '/users/sign_in'
fill_in "user_email", :with => "user@surveybuilder.com"
fill_in "user_password", :with => "user1234"
click_button "Log in"
end
Given /^I exist as a user$/ do
create_user
end
Given /^I do not exist as a user$/ do
create_visitor
delete_user
end
Given /^I exist as an unconfirmed user$/ do
create_unconfirmed_user
end
### WHEN ###
When /^I sign in with valid credentials$/ do
create_user
sign_in
end
When /^I sign out$/ do
click_link("Logout")
#visit '/users/sign_out'
end
When /^I return to the site$/ do
visit '/'
end
When /^I sign in with a wrong email$/ do
@visitor = @visitor.merge(:email => "wrong@example.com")
sign_in
end
When /^I sign in with a wrong password$/ do
@visitor = @visitor.merge(:password => "wrongpass")
sign_in
end
When /^I edit my account details$/ do
click_link "Edit account"
fill_in "user_name", :with => "newname"
fill_in "user_current_password", :with => @visitor[:password]
click_button "Update"
end
When /^I look at the list of users$/ do
visit '/'
end
### THEN ###
Then /^I should be signed in$/ do
page.should have_content "Logout"
page.should_not have_content "Sign up"
page.should_not have_content "Login"
end
Then /^I should be signed out$/ do
page.should have_content "Sign up"
page.should have_content "Login"
page.should_not have_content "Logout"
end
Then /^I see an unconfirmed account message$/ do
page.should have_content "You have to confirm your account before continuing."
end
Then /^I see a successful sign in message$/ do
page.should have_content "Signed in successfully."
end
Then /^I should see an invalid email message$/ do
page.should have_content "Email is invalid"
end
Then /^I should see a missing password message$/ do
page.should have_content "Password can't be blank"
end
Then /^I should see a missing password confirmation message$/ do
page.should have_content "Password doesn't match confirmation"
end
Then /^I should see a mismatched password message$/ do
page.should have_content "Password doesn't match confirmation"
end
Then /^I should see a signed out message$/ do
page.should have_content "Signed out successfully."
end
Then /^I see an invalid login message$/ do
page.should have_content "Invalid email or password."
end
Then /^I should see an account edited message$/ do
page.should have_content "You updated your account successfully."
end
Then /^I should get a download with the filename "([^\"]*)"$/ do |filename|
page.driver.response.headers['Content-Disposition'].should match /^attachment/
end
