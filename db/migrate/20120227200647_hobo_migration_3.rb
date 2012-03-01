class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :prop_changes, :rop_email, :string
  end

  def self.down
    remove_column :prop_changes, :rop_email
  end
end
