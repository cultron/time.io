class AddAssociations < ActiveRecord::Migration
  def up
    add_column :time_entries, :account_id, :integer
    add_column :time_entries, :invoice_id, :integer
    add_column :time_entries, :user_id, :integer
    add_column :invoices, :user_id, :integer
    add_column :invoices, :account_id, :integer
  end

  def down
    remove_column :time_entries, :account_id
    remove_column :time_entries, :invoice_id
    remove_column :time_entries, :user_id
    remove_column :invoices, :user_id
    remove_column :invoices, :account_id
  end
end
