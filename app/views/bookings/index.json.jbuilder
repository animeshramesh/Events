json.array!(@bookings) do |booking|
  json.extract! booking, :id, :email, :movieID, :theatreID, :date, :time, :seats, :cost
  json.url booking_url(booking, format: :json)
end
