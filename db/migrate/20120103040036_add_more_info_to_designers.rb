class AddMoreInfoToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :username, :string
    add_column :designers, :prestige, :string, :default=>'Rookie'
    add_column :designers, :earning, :float, :default=>0
    add_column :designers, :rating, :float,:default=>00
  end
end
