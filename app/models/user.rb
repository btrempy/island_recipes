# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  full_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:recipes, { :class_name => "Recipe", :foreign_key => "owner_id", :dependent => :destroy })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "commentor_id", :dependent => :destroy })
  has_many(:likes, { :class_name => "Like", :foreign_key => "user_id", :dependent => :destroy })
end
