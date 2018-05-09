class CreateSiteInfomations < ActiveRecord::Migration[5.0]
  def change
    create_table :site_infomations do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :url_image
      t.timestamps
    end
  end
end
