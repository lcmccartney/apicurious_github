class Profile < OpenStruct

  def self.service(user)
    @@service ||= ProfileService.new(user)
  end

  def self.find(user)
    user_hash = service(user).get_profile
    Profile.new(user_hash)
  end

  def self.followings(user)
    followings_hash = service(user).get_followings
    followings_hash.map { |following| Profile.new(following) }
  end
end
