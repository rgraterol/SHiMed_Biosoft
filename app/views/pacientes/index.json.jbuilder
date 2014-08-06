json.array!(@pacientes) do |paciente|
  json.extract! paciente, :id
  json.url paciente_url(paciente, format: :json)
end
