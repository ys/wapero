class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @users.to_json(
      :only => [ :name, :email, :twitter_name,:role,:event_ids])}
    end
  end
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @user.to_json(
      :only => [ :name, :email, :twitter_name,:role,:event_ids])}
    end
  end

end
