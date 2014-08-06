json.array!(@personas) do |persona|
  json.extract! persona, :id, :nombre, :apellido, :cedula, :direccion, :telefono_casa, :telefono_celular, :telefono_oficina, :sexo, :fecha_nacimiento
  json.url persona_url(persona, format: :json)
end
