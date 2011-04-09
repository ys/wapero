class HomeController < ApplicationController
  def index
    @users = User.desc("name").all
    @events = Event.desc("event_day").where(:event_day.gte => Time.now)

  end

end
