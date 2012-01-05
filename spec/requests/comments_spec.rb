require 'spec_helper'

describe Comment do

  it "should allow only employer to comment in design for his/her project" do
    emp = Factory(:employer)
    designer = Factory(:designer)
    project = Factory(:project, :employer_id => emp.id)
    submission = Factory(:submission,:project_id=>project.id,:designer_id=>designer.id)
    visit "/employers/sign_in"
    fill_in "Email", :with => emp.email
    fill_in "Password", :with => emp.password
    click_button "Sign in"
    visit '/submissions/1/comments/'
    page.should have_css('#new_comment')
    fill_in "comment_context",:with=>"some comment"
    click_button "Create Comment"
    page.should have_content "some comment"

  end
  
  it "should not allow other employer to comment in design for others project" do
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
    page.should_not have_css('#new_comment')

  end
  
  it "should allow designer to comment in his/her design" do
    emp = Factory(:employer)
    designer = Factory(:designer)
    project = Factory(:project, :employer_id => emp.id)
    submission = Factory(:submission,:project_id=>project.id,:designer_id=>designer.id)
    visit "/designers/sign_in"
    fill_in "designer_email", :with => designer.email
    fill_in "designer_password", :with => designer.password
    click_button "designer_submit"
    visit '/submissions/1/comments/'
    page.should have_css('#new_comment')
    fill_in "comment_context",:with=>"some comment"
    click_button "Create Comment"
    page.should have_content "some comment"

  end
  
  it "should not allow other designer to comment on others design" do
    emp = Factory(:employer)
    designer = Factory(:designer)
    designer2 = Factory(:designer)
    project = Factory(:project, :employer_id => emp.id)
    submission = Factory(:submission,:project_id=>project.id,:designer_id=>designer.id)
    visit "/designers/sign_in"
    fill_in "designer_email", :with => designer2.email
    fill_in "designer_password", :with => designer2.password
    click_button "designer_submit"
    visit '/submissions/1/comments/'
    page.should_not have_css('#new_comment')

  end
  


end


