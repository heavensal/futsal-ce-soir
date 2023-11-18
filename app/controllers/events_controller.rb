class EventsController < ApplicationController
  def index
    @events = Event.find_in_batches(:batch_size => 100)
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_player = EventPlayer.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_event)
    @event.author = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      redirect_to new_event_path
    end
  end

  def update
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private

  def params_event
    params.require(:event).permit(:name, :location, :start_time, :price, :max_players)
  end

end
