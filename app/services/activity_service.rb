class ActivityService

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com/")
    @connection.headers["Authorization"] = "token #{user.token}"
  end

  def get_user_activity
    response = @connection.get "users/#{@user.nickname}/events"
    parse(response)
  end

  def get_followings_activity
    followings = Profile.followings(@user)
    followings.map do |following|
      response = @connection.get "users/#{following.login}/events"
      parse(response)
    end.flatten
  end

private

  def parse(response)
    JSON.parse(response.body, symbolize_name: true, object_class: OpenStruct)
  end
end
