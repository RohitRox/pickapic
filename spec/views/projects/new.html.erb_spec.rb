require 'spec_helper'

describe "projects/new.html.erb" do
  before(:each) do
    assign(:project, stub_model(Project,
      :title => "MyString",
      :description => "MyText",
      :budget => 1.5,
      :type => "",
      :file_type => "MyString",
      :logo_type => "MyString",
      :color => "MyText",
      :used_for => "MyString",
      :status => "MyString",
      :employer => nil
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_title", :name => "project[title]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_budget", :name => "project[budget]"
      assert_select "input#project_type", :name => "project[type]"
      assert_select "input#project_file_type", :name => "project[file_type]"
      assert_select "input#project_logo_type", :name => "project[logo_type]"
      assert_select "textarea#project_color", :name => "project[color]"
      assert_select "input#project_used_for", :name => "project[used_for]"
      assert_select "input#project_status", :name => "project[status]"
      assert_select "input#project_employer", :name => "project[employer]"
    end
  end
end
