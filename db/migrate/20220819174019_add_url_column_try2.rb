class AddUrlColumnTry2 < ActiveRecord::Migration[6.0]
  def change

    add_column :recipes, :recipe_url, :string

  end
end
