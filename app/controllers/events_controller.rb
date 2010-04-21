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
    if @event.valid?
      redirect_to seat_event_path(@seat, @event)
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(params[:event])
      params[:candidates].each_pair do |k,v|
        c = Candidate.find_by_code(k.to_s)
        if c
          v=="1" ? @event.add_candidate(c) : @event.remove_candidate(c)
        end
      end
      redirect_to seat_event_path(@seat, @event)
    else
      render :action => "edit"
    end
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
