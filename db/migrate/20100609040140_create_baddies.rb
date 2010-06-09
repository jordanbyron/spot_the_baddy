class CreateBaddies < ActiveRecord::Migration
  def self.up
    create_table :baddies do |t|
      t.timestamps
      t.belongs_to :baddygory
      t.float :latitude
      t.float :longitude
      t.text :city
      t.text :address
      t.text :link
      t.datetime :occurred_at
    end
  end

  def self.down
    drop_table :baddies
  end
end
