class User < ActiveRecord::Base

  def self.find_or_create_from_oauth(user_hash)
    user = User.find_or_create_by(provider: user_hash.provider, uid: user_hash.uid)
    user.provider   = user_hash.provider
    user.uid        = user_hash.uid
    user.token      = user_hash.credentials.token
    user.email      = user_hash.info.email
    user.name       = user_hash.info.name
    user.image      = user_hash.info.image
    user.save

    user
  end

end
