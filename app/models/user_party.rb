class UserParty < ActiveRecord::Base

  validates :user_id, :party_id, :voted, :votes_recieved, :murderer, presence: true

  belongs_to :party
  belongs_to :user

end
