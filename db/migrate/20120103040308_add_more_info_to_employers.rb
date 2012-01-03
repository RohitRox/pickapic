class AddMoreInfoToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :username, :string
    add_column :employers, :prestige, :string, :default=>'Just Joined'
    add_column :employers, :credit, :float, :default=>1000.00
  end
end
