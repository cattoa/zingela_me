class ReportCommunity < ActiveRecord::Base
  belongs_to :community
  has_many :community_growth_forms
end
