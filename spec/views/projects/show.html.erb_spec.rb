require 'spec_helper'

describe "projects/show.html.erb" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Logo Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Used For/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
