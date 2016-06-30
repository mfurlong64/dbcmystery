class UserParty < ActiveRecord::Base

  validates :user_id, :party_id, :voted, :votes_recieved, :murderer, presence: true
end
