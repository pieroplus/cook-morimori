class Foodstuff < ApplicationRecord
  has_many :best_foodstuffs
  has_many :seasons, through: :best_foodstuffs
  has_many :cooks
  has_many :morimoris, through: :cooks
  has_many :foodstuff_makes
  has_many :makes, through: :foodstuff_makes
  belongs_to :category
end
