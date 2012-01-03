class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :rating
      t.references :designer
      t.references :project

      t.timestamps
    end
    add_index :submissions, :designer_id
    add_index :submissions, :project_id
  end
end
