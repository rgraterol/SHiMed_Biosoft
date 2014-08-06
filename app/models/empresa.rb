class Empresa < ActiveRecord::Base
  acts_as :usuario, as: :es_usuario
  actable as: :es_empresa
end
