class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :state,:default=>false
      t.references :employer
      t.references :designer

      t.timestamps
    end
    add_index :messages, :employer_id
    add_index :messages, :designer_id
  end
end

