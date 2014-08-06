class Medico < ActiveRecord::Base
  acts_as :persona, as: :es_persona
end
