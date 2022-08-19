# == Schema Information
#
# Table name: recipes
#
#  id             :integer          not null, primary key
#  category       :string
#  description    :string
#  food_name      :string
#  length_to_make :integer
#  picture        :text
#  recipe_url     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Recipe < ApplicationRecord
  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id" })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "recipe_id", :dependent => :destroy })
  has_many(:likes, { :class_name => "Like", :foreign_key => "recipe_id", :dependent => :destroy })
end
