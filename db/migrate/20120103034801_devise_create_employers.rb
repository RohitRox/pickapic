class DeviseCreateEmployers < ActiveRecord::Migration
  def change
    create_table(:employers) do |t|
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

    add_index :employers, :email,                :unique => true
    add_index :employers, :reset_password_token, :unique => true
    # add_index :employers, :confirmation_token,   :unique => true
    # add_index :employers, :unlock_token,         :unique => true
    # add_index :employers, :authentication_token, :unique => true
  end

end
