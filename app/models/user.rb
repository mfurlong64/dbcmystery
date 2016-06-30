class User < ActiveRecord::Base

  validates :name, :email, presence: true
  validates :name, uniqueness: true

  has_many :parties, through: :users_parties
  belongs_to :party, through: :user_party

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
