desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

  User.destroy_all
  Recipe.destroy_all
  Like.destroy_all
  Comment.destroy_all

  user1 = User.new
  user1.email = "blake@example.com"
  user1.password = "password"
  user1.full_name = "Blake Trempy"
  user1.save

  user2 = User.new
  user2.email = "alice@example.com"
  user2.password = "password"
  user2.full_name = "Alice Person"
  user2.save

  if user1.errors.any?
    p user1.errors.full_messages
  end

  if user2.errors.any?
    p user2.errors.full_messages
  end

  p "#{User.count} users are in the database."

  # 3.times do
  #   another_user = "#{Faker::Name.unique.name}@example.com"
  #   another_user.password = "password"
  #   another_user.save
  # end

  10.times do
    recipe = Recipe.new
    recipe.food_name = ["tacos", "fajitas", "stir fry", "sandwhich", "frosted flakes", "cesar salad"].sample
    recipe.category = ["american", "mexican", "asian", "BBQ"].sample
    recipe.description = ["this is how you make this recipe 1", "this is how you make this recipe 2", "this is how you make this recipe 3", "this is how you make this recipe 4"].sample
    recipe.length_to_make = rand(10..100)
    recipe.picture = ["https://lh3.googleusercontent.com/2hDpuTi-0AMKvoZJGd-yKWvK4tKdQr_kLIpB_qSeMau2TNGCNidAosMEvrEXFO9G6tmlFlPQplpwiqirgrIPWnCKMvElaYgI-HiVvXc=w600", "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tfGVufDB8fDB8fA%3D%3D&w=1000&q=80", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMPl1LBYwtacjm9BVey-wYpamH_iN7jMwnUUUCp1V7NA&s", "https://media.moddb.com/cache/images/members/5/4550/4549205/thumb_620x2000/duck.jpg"].sample
    recipe.owner_id  = user1.id
    recipe.save
  end

  10.times do
    recipe = Recipe.new
    recipe.food_name = ["tacos", "fajitas", "stir fry", "sandwhich", "frosted flakes", "cesar salad"].sample
    recipe.category = ["american", "mexican", "asian", "BBQ"].sample
    recipe.description = ["this is how you make this recipe 1", "this is how you make this recipe 2", "this is how you make this recipe 3", "this is how you make this recipe 4"].sample
    recipe.length_to_make = rand(10..100)
    recipe.picture = ["https://lh3.googleusercontent.com/2hDpuTi-0AMKvoZJGd-yKWvK4tKdQr_kLIpB_qSeMau2TNGCNidAosMEvrEXFO9G6tmlFlPQplpwiqirgrIPWnCKMvElaYgI-HiVvXc=w600", "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tfGVufDB8fDB8fA%3D%3D&w=1000&q=80", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMPl1LBYwtacjm9BVey-wYpamH_iN7jMwnUUUCp1V7NA&s", "https://media.moddb.com/cache/images/members/5/4550/4549205/thumb_620x2000/duck.jpg"].sample
    recipe.owner_id  = user2.id
    recipe.save
  end

  10.times do
    like = Like.new
    like.user_id  = user1.id
    like.recipe_id  = rand(10..20)
    like.save
  end

  10.times do
    like = Like.new
    like.user_id  = user2.id
    like.recipe_id  = rand(1..10)
    like.save
  end

  10.times do
    comment = Comment.new
    comment.comment_text = Faker::Company.catch_phrase
    comment.recipe_id  = rand(1..20)
    comment.commentor_id  = user2.id
    comment.save
  end

  10.times do
    comment = Comment.new
    comment.comment_text = Faker::Company.catch_phrase
    comment.recipe_id  = rand(1..20)
    comment.commentor_id  = user2.id
    comment.save
  end

  p "#{Recipe.count} Recipes in the database."
  p "#{Like.count} Likes in the database."
  p "#{Comment.count} Comments in the database."

end
