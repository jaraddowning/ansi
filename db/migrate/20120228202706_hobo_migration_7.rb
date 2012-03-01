class HoboMigration7 < ActiveRecord::Migration
  def self.up
    remove_column :standard_areas, :std_id
  end

  def self.down
    add_column :standard_areas, :std_id, :integer
  end
end
