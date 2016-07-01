get '/parties/:id' do

  if current_user      #if user registered then send to log in
   redirect "/parties/#{params[:id]}/login"

  else
    redirect "/users/new"   #sends user to register!
  end
    # If the party is in the current session then do x
    # If the user is not in the session the move on
end

get '/parties/:id/login' do
  current_user ==
end
