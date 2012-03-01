class HoboMigration2 < ActiveRecord::Migration
  def self.up
    change_column :prop_changes, :date, :date, :limit => nil
  end

  def self.down
    change_column :prop_changes, :date, :string
  end
end
