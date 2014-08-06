json.array!(@medicos) do |medico|
  json.extract! medico, :id, :cmv, :cv, :url
  json.url medico_url(medico, format: :json)
end
