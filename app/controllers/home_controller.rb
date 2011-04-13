class HomeController < ApplicationController
  def index
    @users = User.by_name.all
    @events = Event.future

  end

end
