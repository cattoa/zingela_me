class Community < ActiveRecord::Base
  belongs_to :project
  validates :project, presence: true
  validates :description, presence: true
end
