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
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Recipe < ApplicationRecord
end
