class Species < ActiveRecord::Base
  belongs_to :species_family
  has_many :observations
  has_many :community_covers
end
