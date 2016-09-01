class RepoService

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com/")
    @connection.headers["Authorization"] = "token #{user.token}"
  end

  def get_starred_repos
    response = @connection.get "user/starred"
    parse(response)
  end

  def get_user_repos
    response = @connection.get "user/repos"
    parse(response)
  end

private

  def parse(response)
    JSON.parse(response.body, symbolize_name: true, object_class: OpenStruct)
  end
end
