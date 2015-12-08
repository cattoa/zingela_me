class CommunityCover < ActiveRecord::Base
  belongs_to :species
  belongs_to :observation
end
