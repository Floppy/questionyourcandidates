class SeatsController < ApplicationController
  def index
    @seats = Seat.find :all
  end

  def show
    @seat = Seat.find_by_code params[:id]
    raise ActiveRecord::RecordNotFound unless @seat
  end

end
