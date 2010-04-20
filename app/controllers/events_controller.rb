class EventsController < ApplicationController
  before_filter :get_seat
  before_filter :get_event, :except => [:new, :create]

  def show
  end

  def new
    @event = @seat.events.new
  end

  def create
    @event = @seat.events.create(params[:event])
    redirect_to seat_event_path(@seat, @event)
  end

  def edit
  end

  def update
    @event.update_attributes(params[:event])
    redirect_to seat_event_path(@seat, @event)
  end

  protected
  
  def get_seat
    @seat = Seat.find_by_code params[:seat_id]
    raise ActiveRecord::RecordNotFound unless @seat
  end

  def get_event
    @event = @seat.events.find params[:id]
  end

end
