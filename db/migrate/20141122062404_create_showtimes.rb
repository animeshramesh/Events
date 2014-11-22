class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.integer :eventID
      t.integer :locID
      t.string :date
      t.string :time
      t.integer :cost

      t.timestamps
    end
  end
end
