class Event < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :event_players, dependent: :destroy

  has_many :players, through: :event_players, class_name: 'User'
  has_many :teams, dependent: :destroy

  def set_teams(current_user)
    team_a = self.teams.create!(name: 'Equipe 1')
    self.teams.create!(name: 'Equipe 2')
    self.teams.create!(name: 'Sur le banc')
    self.event_players.create!(player: current_user, team: team_a)
  end
end
