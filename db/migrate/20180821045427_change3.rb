class Change3 < ActiveRecord::Migration[5.0]
  def change
    add_column    :morimoris, :text, :text
  end
end
