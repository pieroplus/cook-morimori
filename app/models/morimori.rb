class Morimori < ApplicationRecord
  has_many :cooks
  has_many :foodstuffs, through: :cooks
  has_many :makes
  belongs_to :user, counter_cache: true

  mount_uploader :image, MorimoriImageUploader

end
