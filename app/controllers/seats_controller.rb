class SeatsController < ApplicationController
  def index
    @seats = Seat.find :all
  end

  def show
    @has_feed = true
    @seat = Seat.find_by_code params[:id]    
    raise ActiveRecord::RecordNotFound unless @seat  
    @events = @seat.events
    respond_to do |format|      
      format.html {
        # We need to lazy-load boundaries:
        @seat.init_bounding_box!
      }
      format.atom
      format.icalendar
    end
  end

end
