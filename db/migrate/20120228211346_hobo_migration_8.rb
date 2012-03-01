class HoboMigration8 < ActiveRecord::Migration
  def self.up
    rename_column :prop_changes, :chapter_id, :standard_id
    rename_column :prop_changes, :subchapter_id, :standard_area_id
    remove_column :prop_changes, :org_rep

    remove_index :prop_changes, :name => :index_prop_changes_on_subchapter_id rescue ActiveRecord::StatementInvalid
    remove_index :prop_changes, :name => :index_prop_changes_on_chapter_id rescue ActiveRecord::StatementInvalid
    add_index :prop_changes, [:standard_id]
    add_index :prop_changes, [:standard_area_id]
  end

  def self.down
    rename_column :prop_changes, :standard_id, :chapter_id
    rename_column :prop_changes, :standard_area_id, :subchapter_id
    add_column :prop_changes, :org_rep, :string

    remove_index :prop_changes, :name => :index_prop_changes_on_standard_id rescue ActiveRecord::StatementInvalid
    remove_index :prop_changes, :name => :index_prop_changes_on_standard_area_id rescue ActiveRecord::StatementInvalid
    add_index :prop_changes, [:subchapter_id]
    add_index :prop_changes, [:chapter_id]
  end
end
