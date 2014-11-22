class Showtime < ActiveRecord::Base
	belongs_to :event, foreign_key: "eventID", primary_key: "id"
	belongs_to :location
end
