class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.float :budget
      t.datetime :deadline
      t.string :type
      t.string :file_type, :default => "ai, png"
      t.string :logo_type, :default => "illustrative,iconic,textual"
      t.text :color, :default => "Any color that look good for this design"
      t.string :used_for, :default => "Not specified"
      t.string :status, :default=>"open"
      t.references :employer

      t.timestamps
    end
    add_index :projects, :employer_id
  end
end
