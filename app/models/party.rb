class Party < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, :login, :email, presence: true
  validates :password_hash, uniqueness: true
end
