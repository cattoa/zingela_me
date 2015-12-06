class FieldDatum < ActiveRecord::Base
  belongs_to :location
  belongs_to :project
  has_many :observations, dependent: :destroy
  # accepts_nested_attributes_for :observations, :reject_if => lambda { |a| a[:n].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :observations, reject_if: :all_blank, allow_destroy: true
  validates :project, presence: true
  validates :location, presence: true
  def full_name
    "Project: #{project.name} - Location: #{location.name} - Date: #{date}"
  end
  def short_name
    "#{project.name}, #{location.name}, #{date}"
  end
end
