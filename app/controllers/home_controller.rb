class HomeController < ApplicationController
  def index
    @users = User.desc("name").all
    @events = Event.future

  end

end
