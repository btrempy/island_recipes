# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  comment_text :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commentor_id :integer
#  recipe_id    :integer
#
class Comment < ApplicationRecord
  belongs_to(:commentor, { :required => true, :class_name => "User", :foreign_key => "commentor_id" })
  belongs_to(:recipe, { :required => true, :class_name => "Recipe", :foreign_key => "recipe_id" })
end
