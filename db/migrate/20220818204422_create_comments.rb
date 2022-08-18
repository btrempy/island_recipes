class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.integer :recipe_id
      t.integer :commentor_id

      t.timestamps
    end
  end
end
