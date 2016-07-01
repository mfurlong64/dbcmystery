helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_party
    User.find(session[:party_id]) if session[:party_id]
  end
end
