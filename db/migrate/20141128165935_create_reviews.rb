class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :userID
      t.integer :eventID
      t.string :reviewText

      t.timestamps
    end
  end
end
