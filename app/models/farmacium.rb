class Farmacium < ActiveRecord::Base
  acts_as :empresa, as: :es_empresa
end
