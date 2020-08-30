class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :primary_address, null: false
      t.string :other_address
      t.string :website
      t.string :phone
      t.decimal :lat, precision: 10, scale: 8, null: false
      t.decimal :lng, precision: 10, scale: 8, null: false
      t.boolean :closed, null: false
      t.string :category_id

      t.timestamps
    end
  end
end
