class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :posts

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user
      return user
    else
      registered_user = User.where(email: auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:      auth.extra.raw_info.name,
                           provider:  auth.provider,
                           uid:       auth.uid,
                           email:     auth.info.email,
                           password:  Devise.friendly_token[0,20])
      end
    end
  end

  def add_tags(tags)
    update_attributes favourite_tags: (favourite_tags + Array(tags).map(&:to_i)).to_set
  end

  def remove_tags(tags)
    update_attributes favourite_tags: (favourite_tags - Array(tags).map(&:to_i)).to_set
  end

  def favourite_tags=(tags)
    favourite_tags_will_change!
    super Array(tags)
  end
end
