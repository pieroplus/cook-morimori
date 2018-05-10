class Morimori < ApplicationRecord
  has_many :cooks
  has_many :foodstuffs through: :cooks
  has_many :makes
  has_many :morimori_images
  belongs_to :user
end
