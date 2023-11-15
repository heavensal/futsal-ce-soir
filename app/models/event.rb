class Event < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :event_players, dependent: :destroy

  has_many :players, through: :event_players, class_name: 'User'
  has_many :teams, dependent: :destroy

  before_save :set_name
  after_create :set_teams


  private

  def set_name
    self.name = name[0].upcase + name[1..-1]
  end

  def set_teams
    team_a = teams.create!(name: 'Equipe 1')
    teams.create!(name: 'Equipe 2')
    teams.create!(name: 'Sur le banc')
    event_players.create!(player: author, team: team_a)
  end
end
