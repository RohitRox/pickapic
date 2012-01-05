require 'spec_helper'

describe Project do
  
  it "should allow designer to submmit design" do
    emp = Factory(:employer)
    user = Factory(:designer)
    project = Factory(:project, :employer_id => emp.id)
    visit "/designers/sign_in"
    fill_in "designer_email", :with => user.email
    fill_in "designer_password", :with => user.password
    click_button "designer_submit"
    visit '/projects/1/'
    page.should have_content('Submit Your Logo')
  end
  
  
  it "should allow only employer to rate design for his/her project" do
    emp = Factory(:employer)
    designer = Factory(:designer)
    project = Factory(:project, :employer_id => emp.id)
    submission = Factory(:submission,:project_id=>project.id,:designer_id=>designer.id)
    visit "/employers/sign_in"
    fill_in "Email", :with => emp.email
    fill_in "Password", :with => emp.password
    click_button "Sign in"
    visit '/projects/1/'
    page.should have_css('a.rating')
    page.should have_content('rate_it')
    click_link "rate_it"
    page.should have_content("Your Rating Have Been Saved")
  
  end
  
  it "should not allow other employer to rate design for others project" do
    emp = Factory(:employer)
    emp2 = Factory(:employer)
    designer = Factory(:designer)
    project = Factory(:project, :employer_id => emp.id)
    submission = Factory(:submission,:project_id=>project.id,:designer_id=>designer.id)
    visit "/employers/sign_in"
    fill_in "Email", :with => emp2.email
    fill_in "Password", :with => emp2.password
    click_button "Sign in"
    visit '/projects/1/'
    page.should_not have_css('#rating_block_1 a')
  end
  
  it "should not allow designers to rate any design" do
    emp = Factory(:employer)
    designer = Factory(:designer)
    project = Factory(:project, :employer_id => emp.id)
    submission = Factory(:submission,:project_id=>project.id,:designer_id=>designer.id)
    visit "/designers/sign_in"
    fill_in "designer_email", :with => designer.email
    fill_in "designer_password", :with => designer.password
    click_button "designer_submit"
    visit '/projects/1/'
    page.should_not have_css('#rating_block_1 a')
  end
  
  it "should allow employer to aprrove and reward design for his/her project" do
    emp = Factory(:employer)
    designer = Factory(:designer)
    project = Factory(:project, :employer_id => emp.id)
    submission = Factory(:submission,:project_id=>project.id,:designer_id=>designer.id)
    visit "/employers/sign_in"
    fill_in "Email", :with => emp.email
    fill_in "Password", :with => emp.password
    click_button "Sign in"
    visit '/submissions/1/comments/'
    page.should have_content('Reward This Design')
  end
  
  
  it "should not allow other employer to aprrove and reward design for others project" do
    emp = Factory(:employer)
    emp2 = Factory(:employer)
    designer = Factory(:designer)
    project = Factory(:project, :employer_id => emp.id)
    submission = Factory(:submission,:project_id=>project.id,:designer_id=>designer.id)
    visit "/employers/sign_in"
    fill_in "Email", :with => emp2.email
    fill_in "Password", :with => emp2.password
    click_button "Sign in"
    visit '/submissions/1/comments/'
    page.should_not have_content('Reward This Design')
  end
  
end