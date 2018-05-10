class CreateFoodstuffMakes < ActiveRecord::Migration[5.0]
  def change
    create_table :foodstuff_makes do |t|
      t.references :foodstuff
      t.references :make
      t.timestamps
    end
  end
end
