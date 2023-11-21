class EventPlayer < ApplicationRecord
  belongs_to :event
  belongs_to :player, class_name: 'User'
  belongs_to :team

  validate :validate_max_players, on: :create

  private

  def validate_max_players
    # Compter uniquement les joueurs des deux premières équipes
    teams_in_play = event.teams.limit(2)
    player_count = EventPlayer.where(event: event, team: teams_in_play).count

    if player_count >= event.max_players
      errors.add(:base, "Nombre maximum de joueurs atteint pour cet événement.")
    end
  end
end
