FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  sequence :username do |n|
    "user#{n}"
  end
end

FactoryGirl.define do
  factory :employer do
    username 
    email
    password "123456"
    password_confirmation '123456'
  end
end

FactoryGirl.define do
  factory :designer do
    username
    email
    password "123456"
    password_confirmation '123456'
  end
end

FactoryGirl.define do
  factory :project do
    title "Project1"
    description "the project is important one and very good one"
    budget "100"
    deadline Time.now + (1*24*60*60)
    employer_id "1"
    project_type "public"
  end   
end

FactoryGirl.define do
  factory :submission do
    screenshot_file_name "sample.png"
    screenshot_content_type "image/png"
    screenshot_file_size "1024"
    screenshot_updated_at Time.now
    project_id "1"
  end   
end