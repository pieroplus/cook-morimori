class Change2 < ActiveRecord::Migration[5.0]
  def change
    add_reference    :foodstuffs, :category
  end
end
