class Place < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :photos 

  geocoded_by :address
  after_validation :geocode
  validates :name, presence: true, length: { minimum: 3, too_short: "must be longer than %{count} characters." }
  validates :address, :description, presence: true
  
  validates :name, presence: true
end
