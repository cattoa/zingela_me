class Community < ActiveRecord::Base
  belongs_to :project
  validates :project, presence: true
  validates :description, presence: true
  has_many :report_communities, dependent: :destroy
end
