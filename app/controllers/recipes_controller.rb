class RecipesController < ApplicationController


  def index
    matching_recipes = Recipe.all

    @list_of_recipes = matching_recipes.order({ :created_at => :desc })

    render({ :template => "recipes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_recipes = Recipe.where({ :id => the_id })

    @the_recipe = matching_recipes.at(0)

    render({ :template => "recipes/show.html.erb" })
  end

  def create
    the_recipe = Recipe.new
    the_recipe.owner_id = params.fetch("query_owner_id")
    the_recipe.category = params.fetch("query_category")
    the_recipe.description = params.fetch("query_description")
    the_recipe.length_to_make = params.fetch("query_length_to_make")
    the_recipe.picture = params.fetch("query_picture")
    the_recipe.food_name = params.fetch("query_food_name")
    the_recipe.recipe_url= params.fetch("query_recipe_url")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/user_home", { :notice => "Recipe created successfully." })
    else
      redirect_to("/user_home", { :alert => the_recipe.errors.full_messages.to_sentence })
    end
  end

  def create_form
    render({ :template => "recipes/create_form.html.erb" })
  end

  def update
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.owner_id = params.fetch("query_owner_id")
    the_recipe.category = params.fetch("query_category")
    the_recipe.description = params.fetch("query_description")
    the_recipe.length_to_make = params.fetch("query_length_to_make")
    the_recipe.picture = params.fetch("query_picture")
    the_recipe.food_name = params.fetch("query_food_name")
    the_recipe.recipe_url= params.fetch("query_recipe_url")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes/#{the_recipe.id}", { :notice => "Recipe updated successfully." })
    else
      redirect_to("/recipes/#{the_recipe.id}", { :alert => the_recipe.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")

    the_user = @current_user.id

    the_recipe = Recipe.where({ :id => the_id }).at(0)

    if the_recipe.owner_id == the_user
      the_recipe.destroy

      redirect_to("/user_home", { :notice => "Recipe deleted successfully." })
    else
      redirect_to("/user_home", { :alert => "Recipe does not belong to you and cannot be deleted. Please only delete your own recipes" })
    end
  end
end
