class Observation < ActiveRecord::Base
  belongs_to :field_datum
  belongs_to :species

  has_many :plant_covers , dependent: :destroy
  has_many :growth_forms , dependent: :destroy
  has_many :crown_diameters , dependent: :destroy

  accepts_nested_attributes_for :plant_covers, reject_if: :all_blank, allow_destroy: false
  accepts_nested_attributes_for :growth_forms, reject_if: :all_blank, allow_destroy: false
  accepts_nested_attributes_for :crown_diameters, reject_if: :all_blank, allow_destroy: false
end
