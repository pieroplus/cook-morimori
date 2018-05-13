class Morimori < ApplicationRecord
  has_many :cooks
  has_many :foodstuffs, through: :cooks
  has_many :makes
  belongs_to :user

  mount_uploader :image, MorimoriImageUploader

end
