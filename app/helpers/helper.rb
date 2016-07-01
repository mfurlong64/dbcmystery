helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_party
    User.find(session[:party_id]) if session[:party_id]
  end

  def get_users_parties

  holder_array = []
    current_user.parties.each do |party|
      party.id
    end
  end

  def user_voted
    return session[:party_id].user_parties.find_by(user_id: current_user.id).vote
  end
end
