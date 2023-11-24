class EventPlayersController < ApplicationController
  def create_or_update
    @event = Event.find(params[:event_id])
    @event_player = EventPlayer.find_or_initialize_by(event: @event, player: current_user)
    @event_player.team_id = event_player_params[:team_id]
    @team = @event_player.team
    if @event_player.save
      redirect_to event_path(@event)
    end
  end

  private

  def event_player_params
    params.require(:event_player).permit(:team_id)
  end
end
