class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @last_tweet =  Twitter.user_timeline(@user.twitter_name).first.text
  end

end
