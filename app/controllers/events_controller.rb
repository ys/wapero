class EventsController < ApplicationController
  
  before_filter :authenticate_user! , :except => [:show, :index]
  before_filter :is_admin! , :except => [:show,:index, :join, :leave, :comment]
  
  
  def is_admin!
    if authenticate_user!
      unless current_user.is_admin?
        flash[:warning] = "You're not the right user!"
        redirect_to root_url
      end
    end
  end
  # GET /events
  # GET /events.json
  def index
    @events = Event.desc("event_day").all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @event.event_day = Time.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @event.creator = current_user

    # TODO: DRY this
    require 'net/http'
    url = URI.parse('http://maps.googleapis.com/maps/api/geocode/json?address='+URI.encode(@event.location)+'&sensor=false')
    r = Net::HTTP.get_response(url)
    j = JSON::parse(r.body)
    @event.geocoded = j


    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.json  { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    # TODO: DRY this
    require 'net/http'
    url = URI.parse('http://maps.googleapis.com/maps/api/geocode/json?address='+URI.encode(@event.location)+'&sensor=false')
    r = Net::HTTP.get_response(url)
    j = JSON::parse(r.body)
    @event.geocoded = j

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.json  { head :ok }
    end
  end
  
  # POST /events/1/participate
  # POST /events/1/participate.json
  def join
    @event = Event.find(params[:id])
    if (!@event.users.include? current_user)
      @event.users << current_user
    end
    
    respond_to do |format|
      if @event.update
        format.html { redirect_to(@event) }
        format.json  { head :ok }
      else
        format.html { render :action => "show" }
        format.json  { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /events/1/participate
  # DELETE /events/1/participate.json
  def leave
    @event = Event.find(params[:id])
    @event.users.delete current_user
    current_user.events.delete @event
    current_user.update
    
    respond_to do |format|
      if @event.update
        format.html { redirect_to(@event) }
        format.json  { head :ok }
      else
        format.html { render :action => "show" }
        format.json  { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # POST /events/1/comment
  def comment
    @event = Event.find(params[:id])
    @comment = Comment.new
    @comment.comment_body = params[:comment]
    @comment.author = current_user
    @event.comments << @comment
    respond_to do |format|
      if @event.update
        format.html { redirect_to(@event) }
        format.json  { head :ok }
      else
        format.html { render :action => "show" }
        format.json  { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  

end
