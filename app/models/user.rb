class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :set_username

  has_many :event_players
  has_many :events, through: :event_players

  private

  def set_username
    random_number = rand(1000..9999)
    loop do
      self.username = "#{first_name.capitalize}#{last_name[0].capitalize}##{random_number}"
      break unless User.exists?(username: self.username)
    end
  end
end
