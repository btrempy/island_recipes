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

end
