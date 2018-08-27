class Make < ApplicationRecord
  belongs_to :morimori
  has_many :foodstuff_makes
  has_many :foodstuffs, through: :foodstuff_makes

  mount_uploader :image, ImageUploader

end
