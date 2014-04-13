class EventsController < ApplicationController
  def index
    @event_days = Event.order(:date).group_by{ |event| event.date.to_date }.to_a
  end

  def show
    @event = Event.find(params[:id])
  end
end
