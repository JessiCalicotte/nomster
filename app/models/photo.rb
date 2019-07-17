class Photo < ApplicationRecord
  belongs_to :user
  has_many :place
  has_many :comments

  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: true
end
