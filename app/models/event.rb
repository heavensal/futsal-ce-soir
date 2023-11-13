class Event < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :players, through: :event_players
end
