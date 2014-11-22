json.array!(@showtimes) do |showtime|
  json.extract! showtime, :id, :eventID, :locID, :date, :time, :cost
  json.url showtime_url(showtime, format: :json)
end
