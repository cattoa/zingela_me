class CommunityCover < ActiveRecord::Base
  belongs_to :species
  belongs_to :community_growth_form
end
