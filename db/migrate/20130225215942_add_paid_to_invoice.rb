class AddPaidToInvoice < ActiveRecord::Migration
  def change
    change_column :time_entries, :hours, :decimal, :precision => 10, :scale => 2
    change_column :accounts, :rate, :decimal, :precision => 10, :scale => 2
  end
end
