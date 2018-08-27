class Morimori < ApplicationRecord
  has_many :morimori_foodstuffs
  has_many :foodstuffs, through: :morimori_foodstuffs
  has_many :makes
  belongs_to :user, counter_cache: true

  mount_uploader :image, ImageUploader

  scope :recommend_food, -> (morimori_ids){where('id = ?', morimori_ids)}
  scope :main_sub, -> (id){where('mainsub_id = ?', id)} # 0:副菜, 1:主菜
  scope :get_random, -> (count){order("RAND()").limit(count)}
  scope :get_category, -> (id){where('category_id = ?', id).limit(7)}



end
