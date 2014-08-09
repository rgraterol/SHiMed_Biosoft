json.array!(@centros_examenes) do |centro_examene|
  json.extract! centro_examene, :id
  json.url centro_examene_url(centro_examene, format: :json)
end
