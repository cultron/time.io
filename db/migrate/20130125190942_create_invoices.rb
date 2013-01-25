class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.boolean :issued
      t.datetime :issued_date

      t.timestamps
    end
  end
end
