class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :prop_changes do |t|
      t.string   :name
      t.string   :date
      t.string   :phone
      t.string   :organization
      t.string   :email
      t.string   :address
      t.string   :city
      t.string   :state
      t.string   :zip
      t.string   :org_rep
      t.string   :chapter
      t.string   :subchapter
      t.string   :com_rec
      t.text     :comment
      t.text     :support
      t.string   :signature
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :prop_changes
  end
end
