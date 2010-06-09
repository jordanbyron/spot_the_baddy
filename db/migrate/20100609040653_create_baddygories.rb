class CreateBaddygories < ActiveRecord::Migration
  def self.up
    create_table :baddygories do |t|
      t.text :name
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :baddygories
  end
end
