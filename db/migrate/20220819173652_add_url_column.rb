class AddUrlColumn < ActiveRecord::Migration[6.0]
  def change

      add_column :recipe, :recipe_url, :string


  end
end
