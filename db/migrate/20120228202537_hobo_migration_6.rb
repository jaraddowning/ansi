class HoboMigration6 < ActiveRecord::Migration
  def self.up
    add_column :standard_areas, :standard_id, :integer

    add_index :standard_areas, [:standard_id]
  end

  def self.down
    remove_column :standard_areas, :standard_id

    remove_index :standard_areas, :name => :index_standard_areas_on_standard_id rescue ActiveRecord::StatementInvalid
  end
end
