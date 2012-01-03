class DeviseCreateDesigners < ActiveRecord::Migration
  def change
    create_table(:designers) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :designers, :email,                :unique => true
    add_index :designers, :reset_password_token, :unique => true
    # add_index :designers, :confirmation_token,   :unique => true
    # add_index :designers, :unlock_token,         :unique => true
    # add_index :designers, :authentication_token, :unique => true
  end

end
