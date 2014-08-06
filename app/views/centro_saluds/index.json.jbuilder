json.array!(@centro_saluds) do |centro_salud|
  json.extract! centro_salud, :id, :publico
  json.url centro_salud_url(centro_salud, format: :json)
end
