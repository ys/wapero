class HomeController < ApplicationController
  def index
    @users = User.by_name.all
    @events = Event.future
    @ideas = Idea.desc("title").limit(20)
  end

end
