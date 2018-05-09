class CreateBestFoodstuffs < ActiveRecord::Migration[5.0]
  def change
    create_table :best_foodstuffs do |t|
      t.references :season
      t.references :foodstuff
      t.timestamps
    end
  end
end
