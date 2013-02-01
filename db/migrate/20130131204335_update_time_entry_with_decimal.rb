class UpdateTimeEntryWithDecimal < ActiveRecord::Migration
  def up
    change_column :time_entries, :date, :date
  end

  def down
  end
end
