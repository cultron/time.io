class AddManyToManyUsersToAccounts < ActiveRecord::Migration
  def change
    create_table :user_account do |t|
      t.integer :user_id
      t.integer :account_id
    end


  end
end
