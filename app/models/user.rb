class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :event_players, dependent: :destroy
  has_many :events, through: :event_players
  has_many :teams, through: :event_players

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, class_name: 'User'

  before_save :set_username


  private

  def set_username
    self.first_name.capitalize!
    self.last_name.upcase!
    random_number = rand(1000..9999)
    loop do
      self.username = "#{first_name}#{last_name[0]}##{random_number}"
      break unless User.exists?(username: self.username)
    end
  end
end
