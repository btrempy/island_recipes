class UserController < ApplicationController
  def index

    render({ :template => "user/index.html.erb" })
  end

  def user_home
    the_user = @current_user.id

    all_recipes = Recipe.all
    @user_recipes = all_recipes.where({ :owner_id => the_user })

    all_likes = Like.all
    @user_likes = all_likes.where({ :user_id => the_user })

    render({ :template => "user/user_home.html.erb" })
  end

  def user_recipes
    the_user = @current_user.id

    all_recipes = Recipe.all
    @user_recipes = all_recipes.where({ :owner_id => the_user })

    render({ :template => "user/user_recipes.html.erb" })
  end

  def user_likes
    the_user = @current_user.id

    all_likes = Like.all
    @user_likes = all_likes.where({ :user_id => the_user })

    render({ :template => "user/user_liked_recipes.html.erb" })
  end

  def user_liked_recipe
    the_user = @current_user.id

    the_id = params.fetch("recipe_id")

    the_like = Like.new
    the_like.user_id = the_user
    the_like.recipe_id = the_id

    if the_like.valid?
      the_like.save
      redirect_to("/user_likes", { :notice => "Successfully like recipe." })
    else
      redirect_to("/user_likes", { :alert => the_recipe.errors.full_messages.to_sentence })
    end
  end

  def user_unliked_recipe
    the_user = @current_user.id

    the_id = params.fetch("recipe_id")

    the_like = Like.where({ :id => the_id })

    if the_like.present?
      the_like.destroy
      redirect_to("/user_likes", { :notice => "Successfully unlike recipe." })
    else
      redirect_to("/user_likes", { :alert => the_recipe.errors.full_messages.to_sentence })
    end
  end
end
