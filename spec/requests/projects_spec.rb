require 'spec_helper'

describe Project do
  
  it "should not allow to create unless employer sign in" do
    visit "/employer"
    page.should have_content("You need to sign in or sign up before continuing.")
  end
  
  
  it "should allow employer to create project if signed in" do
    user = Factory(:employer)
    visit "/employers/sign_in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
    click_link "Create A New Logo Project"
    fill_in "Title", :with => "Test"
    fill_in "Description", :with => "examople"
    fill_in "Budget", :with => "100"
    select '2013', :from => 'project_deadline_1i'
    click_button "Create Project"
    page.should have_content("Project was successfully created.")
  end
  
  it "should not allow employer to create project with past date deadline" do
    user = Factory(:employer)
    visit "/employers/sign_in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
    click_link "Create A New Logo Project"
    fill_in "Title", :with => "Test"
    fill_in "Description", :with => "examople"
    fill_in "Budget", :with => "100"
    select '2010', :from => 'project_deadline_1i'
    click_button "Create Project"
    page.should have_content("Invalid Deadline to past date.")
  end
  
  
  
end
