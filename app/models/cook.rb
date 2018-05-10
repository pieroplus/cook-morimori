class Cook < ApplicationRecord
  belongs_to :morimori
  belongs_to :foodstuff
end
