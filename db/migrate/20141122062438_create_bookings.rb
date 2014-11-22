class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :userID
      t.integer :showtimeID
      t.integer :seats

      t.timestamps
    end
  end
end
