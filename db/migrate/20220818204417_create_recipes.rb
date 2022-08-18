class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :owner_id
      t.string :category
      t.string :description
      t.integer :length_to_make
      t.text :picture
      t.string :food_name

      t.timestamps
    end
  end
end
