class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.integer       :prefecture_id,    null: false
      t.string        :postalcode,       null: false
      t.string        :municipality,     null: false
      t.string        :addres,           null: false
      t.string        :building
      t.string        :phonenumber,      null: false
      t.references    :purchase,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
