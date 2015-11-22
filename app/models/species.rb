class Species < ActiveRecord::Base
  belongs_to :species_family
  has_many :observations
end
