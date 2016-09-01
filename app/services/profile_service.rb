class ProfileService

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com/")
    @connection.headers["Authorization"] = "token #{user.token}"
  end

  def get_profile
    response = @connection.get "user"
    parse(response)
  end

  def get_followings
    response = @connection.get "users/#{@user.nickname}/following"
    parse(response)
  end

private

  def parse(response)
    JSON.parse(response.body, symbolize_name: true, object_class: OpenStruct)
  end
end
