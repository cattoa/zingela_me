class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :users
  belongs_to :Admin
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
