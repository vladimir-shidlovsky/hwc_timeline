class User < ActiveRecord::Base
  has_many :posts
  acts_as_inkwell_user
end
