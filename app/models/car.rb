class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  #has_many :users, through: :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
  validates :make, presence: true
  validates :model, presence: true
  validates :price_day, numericality: { only_integer: true }
end
