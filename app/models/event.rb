class Event < ActiveRecord::Base
	has_many :showtimes, foreign_key: "eventID", primary_key: "id"
end
