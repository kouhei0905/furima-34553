class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string   :productname,       null: false
      t.text     :description,       null: false
      t.integer  :category_id,       null: false
      t.integer  :status_id,         null: false 
      t.integer  :burden_id,         null: false 
      t.integer  :days_id,           null: false 
      t.integer  :price,             null: false
      t.integer  :prefectures_id,    null: false
      t.integer  :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
