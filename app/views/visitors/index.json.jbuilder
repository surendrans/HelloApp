json.array!(@visitors) do |visitor|
  json.extract! visitor, :id, :name, :email, :time, :purpose, :poc
  json.url visitor_url(visitor, format: :json)
end
