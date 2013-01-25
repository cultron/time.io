class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_email
      t.integer :rate
      t.datetime :creation_date

      t.timestamps
    end
  end
end
