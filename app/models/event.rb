class Event < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :event_players, dependent: :destroy

  has_many :players, through: :event_players, class_name: 'User'
  has_many :teams, dependent: :destroy

end
