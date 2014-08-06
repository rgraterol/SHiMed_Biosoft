json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :email, :tipo_actor
  json.url usuario_url(usuario, format: :json)
end
