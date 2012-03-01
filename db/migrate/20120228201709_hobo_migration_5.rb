class HoboMigration5 < ActiveRecord::Migration
  def self.up
    add_column :standard_areas, :std_id, :integer
  end

  def self.down
    remove_column :standard_areas, :std_id
  end
end
