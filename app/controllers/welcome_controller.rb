class WelcomeController < ApplicationController
  def index
    @user = Profile.find(current_user)
    @starred_repos = Repo.count(current_user) unless nil
    @repos = Repo.user_repos(current_user)
    @user_activity = Activity.user_activity(current_user)
    @followings_activity = Activity.followings_activity(current_user)
  end
end
