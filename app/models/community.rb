class Community < ActiveRecord::Base
  belongs_to :project
  belongs_to :project_report
  validates :project, presence: true
  validates :description, presence: true
  has_many :report_communities, dependent: :destroy
end
