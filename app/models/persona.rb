class Persona < ActiveRecord::Base
  acts_as :usuario, as: :es_usuario
  actable as: :es_persona
end
