require 'bcrypt'

class Party < ActiveRecord::Base

  validates :title, presence: true
  validates :password_hash, presence: true
  validates :title, uniqueness: true

  has_many :user_parties
  has_many :users, through: :user_parties

  belongs_to :user

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end
end

# Party.create(title: "night walkers", password_hash: "night")

# User.create(name: "mike", email: "mike@mike.com", password_hash: "mike")

# UserParty.new(user_id: 1, party_id: 1)
