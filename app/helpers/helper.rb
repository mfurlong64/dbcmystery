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
end
