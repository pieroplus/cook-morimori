class Season < ApplicationRecord
  has_many :best_foodstuffs
  has_many :foodstuffs, through: :best_foodstuffs
end
