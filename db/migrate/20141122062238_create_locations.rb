class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :locID
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
