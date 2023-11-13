class EventPlayer < ApplicationRecord
  belongs_to :event
  belongs_to :player, class_name: 'User'
  belongs_to :team
end
