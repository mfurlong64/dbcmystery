require 'bcrypt'

class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true
  validates :password_hash, presence: true

  has_many :user_parties
  has_many :parties, through: :user_parties

  belongs_to :party

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
