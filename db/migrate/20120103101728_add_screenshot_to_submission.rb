class AddScreenshotToSubmission < ActiveRecord::Migration
  def self.up
        add_column :submissions, :screenshot_file_name,    :string
        add_column :submissions, :screenshot_content_type, :string
        add_column :submissions, :screenshot_file_size,    :integer
        add_column :submissions, :screenshot_updated_at,   :datetime
      end

      def self.down
        remove_column :submissions, :screenshot_file_name
        remove_column :submissions, :screenshot_content_type
        remove_column :submissions, :screenshot_file_size
        remove_column :submissions, :screenshot_updated_at
      end
   
end
