class CommunityGrowthForm < ActiveRecord::Base
  belongs_to :report_community
  has_many :community_covers, dependent: :destroy
end
