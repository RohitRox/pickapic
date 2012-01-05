class AddDesignerToComments < ActiveRecord::Migration
  def change
    add_column :comments,:designer_id,:integer
  end
end
