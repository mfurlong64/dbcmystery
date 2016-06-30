class Party < ActiveRecord::Base

  validates :title, :password_hash, presence: true
  validates :title, uniqueness: true

  has_many :users, through: :users_parties
  belongs_to :user, through: :user_party

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
