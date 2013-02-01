class UpdateTimeEntry < ActiveRecord::Migration
  def up
    add_column :time_entries, :invoiced, :boolean
  end

  def down
    remove_column :time_entries, :invoiced
  end
end
