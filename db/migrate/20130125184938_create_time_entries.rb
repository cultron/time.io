class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.text :description
      t.integer :hours
      t.datetime :date

      t.timestamps
    end
  end
end
