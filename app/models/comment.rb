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
end
