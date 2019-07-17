class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :place
  

  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: true
end
