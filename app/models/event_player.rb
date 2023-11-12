class EventPlayer < ApplicationRecord
  belongs_to :event
  belongs_to :player
  belongs_to :team
end
