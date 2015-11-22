class Project < ActiveRecord::Base
  has_many :field_datum
  has_many :communities
end
