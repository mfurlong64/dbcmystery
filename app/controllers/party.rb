get '/parties/:id' do
  if session[:party_id]

    # If the party is in the current session then do x


  else

    # If the user is not in the session the move on

    redirect "/parties/#{params[:id]}"
  end
end
