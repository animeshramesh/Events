class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :userID
      t.integer :showtimeID
      t.integer :seats

      t.timestamps
    end
  end
end
