require 'spec_helper'

describe "projects/index.html.erb" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :title => "Title",
        :description => "MyText",
        :budget => 1.5,
        :type => "Type",
        :file_type => "File Type",
        :logo_type => "Logo Type",
        :color => "MyText",
        :used_for => "Used For",
        :status => "Status",
        :employer => nil
      ),
      stub_model(Project,
        :title => "Title",
        :description => "MyText",
        :budget => 1.5,
        :type => "Type",
        :file_type => "File Type",
        :logo_type => "Logo Type",
        :color => "MyText",
        :used_for => "Used For",
        :status => "Status",
        :employer => nil
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Logo Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Used For".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
