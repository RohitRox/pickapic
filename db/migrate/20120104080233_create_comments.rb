class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :context
      t.references :employer
      t.references :submission

      t.timestamps
    end
    add_index :comments, :employer_id
    add_index :comments, :submission_id
  end
end
