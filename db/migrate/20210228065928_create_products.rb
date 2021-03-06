class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string      :productname,       null: false
      t.text        :description,       null: false
      t.integer     :genre_id,       null: false
      t.integer     :status_id,         null: false 
      t.integer     :burden_id,         null: false 
      t.integer     :d_day_id,           null: false 
      t.integer     :price,             null: false
      t.integer     :prefecture_id,    null: false
      t.references  :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
