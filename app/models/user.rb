class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.provider    = auth_info.provider
      new_user.name        = auth_info.extra.raw_info.name
      new_user.uid         = auth_info.uid
      new_user.image       = auth_info.auth_info.info.image
      new_user.nickname    = auth_info.extra.raw_info.login
      new_user.token       = auth_info.credentials.token
    end
  end
end
