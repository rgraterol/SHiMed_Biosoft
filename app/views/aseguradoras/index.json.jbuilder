json.array!(@aseguradoras) do |aseguradora|
  json.extract! aseguradora, :id, :registro_go
  json.url aseguradora_url(aseguradora, format: :json)
end
