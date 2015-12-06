class FieldDatum < ActiveRecord::Base
  belongs_to :project
  belongs_to :community
  has_many :observations, dependent: :destroy

  # accepts_nested_attributes_for :observations, :reject_if => lambda { |a| a[:n].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :observations, reject_if: :all_blank, allow_destroy: true
  validates :project, presence: true
  validates :community, presence: true
  def full_name
    "Project: #{project.name} - Date: #{date}"
  end
  def short_name
    "#{project.name}, #{date}"
  end
end
