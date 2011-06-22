class PossibleDatesController < ApplicationController
  before_filter :authenticate_user! , :except => [:show, :index]
  def index
    @event = Event.find(params[:event_id])
    respond_to do |format|
      format.html
      format.json {render :json => @event.possible_dates}
    end
  end
  def show
     @event = Event.find(params[:event_id])
     @possible_date = @event.possible_dates.find(params[:id])
     respond_to do |format|
       format.html
       format.json {render :json => @possible_date}
     end
  end
  def update
    @event = Event.find(params[:event_id])
    @possible_date = @event.possible_dates.find(params[:id])
    logger.info @possible_date.to_json
    if @possible_date.voters.include?(current_user.id) 
       @possible_date.voters.delete current_user.id 
    else
      @possible_date.voters << current_user.id
    end
     
   
    respond_to do |format|
      if @possible_date.update
        format.html { redirect_to(@event) }
        format.json  { head :ok }
      else
        format.html { redirect_to(@event) }
        format.json  { render :json => @possible_date.errors, :status => :unprocessable_entity }
      end
    end
  end

end
