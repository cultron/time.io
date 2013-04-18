class RenameUserAccountTable < ActiveRecord::Migration
  def up
    rename_table :user_account, :user_accounts
  end

  def down
  end
end
