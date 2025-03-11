class CreateTeas < ActiveRecord::Migration[7.1]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :description
      t.integer :temperature
      t.integer :brew_time
      t.boolean :caffeine_free
      t.string :origin_country
      t.string :tasting_note
      t.decimal :price
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
