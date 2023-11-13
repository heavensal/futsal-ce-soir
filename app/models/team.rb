class Team < ApplicationRecord
  has_many :event_players
  has_many :players, through: :event_players, class_name: 'User'
  belongs_to :event
end
