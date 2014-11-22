class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :eventType
      t.string :name

      t.timestamps
    end
  end
end
