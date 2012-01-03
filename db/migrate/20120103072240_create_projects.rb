class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.float :budget
      t.datetime :deadline
      t.string :type
      t.string :file_type
      t.string :logo_type
      t.text :color
      t.string :used_for
      t.string :status, :default=>"open"
      t.references :employer

      t.timestamps
    end
    add_index :projects, :employer_id
  end
end
