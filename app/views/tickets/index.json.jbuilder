json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :userID, :showtimeID, :seats
  json.url ticket_url(ticket, format: :json)
end
