json.array!(@farmacia) do |farmacium|
  json.extract! farmacium, :id, :reg_sanitario
  json.url farmacium_url(farmacium, format: :json)
end
