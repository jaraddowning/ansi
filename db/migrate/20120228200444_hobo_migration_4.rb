class HoboMigration4 < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :standards do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :standard_areas do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :prop_changes, :state_id, :integer
    add_column :prop_changes, :chapter_id, :integer
    add_column :prop_changes, :subchapter_id, :integer
    remove_column :prop_changes, :state
    remove_column :prop_changes, :chapter
    remove_column :prop_changes, :subchapter

    add_index :prop_changes, [:state_id]
    add_index :prop_changes, [:chapter_id]
    add_index :prop_changes, [:subchapter_id]
  end

  def self.down
    remove_column :prop_changes, :state_id
    remove_column :prop_changes, :chapter_id
    remove_column :prop_changes, :subchapter_id
    add_column :prop_changes, :state, :string
    add_column :prop_changes, :chapter, :string
    add_column :prop_changes, :subchapter, :string

    drop_table :states
    drop_table :standards
    drop_table :standard_areas

    remove_index :prop_changes, :name => :index_prop_changes_on_state_id rescue ActiveRecord::StatementInvalid
    remove_index :prop_changes, :name => :index_prop_changes_on_chapter_id rescue ActiveRecord::StatementInvalid
    remove_index :prop_changes, :name => :index_prop_changes_on_subchapter_id rescue ActiveRecord::StatementInvalid
  end
end
