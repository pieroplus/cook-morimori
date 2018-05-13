class CreateMorimorisFoodstuffs < ActiveRecord::Migration[5.0]
  def change
    create_table :morimoris_foodstuffs do |t|
      t.belongs_to :morimori, index: true
      t.belongs_to :foodstuff, index: true
      t.timestamps
    end
  end
end
