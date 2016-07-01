get '/parties/new' do   # Make sure these are above
  erb :'parties/new'
end

get '/parties/:id' do

  if current_user      #if user registered then send to log in

    redirect "/parties/#{params[:id]}/login"

  else
    redirect "/users/new"   #sends user to register!

  end
    # If the party is in the current session then do x
    # If the user is not in the session the move on
end

# grabs the party id from the params if the user has that part
# auto logs that player if he has that party

get '/parties/:id/login' do

#   current_user.parties.each do |party|
#     if party.id == 3
#       session[:party_id] = party.id
#       redirect "parties/#{party.id}/show"
#     end
#   end

  @party = Party.find(params[:id])
  erb :'/parties/login'

end

post '/parties' do
  @party = Party.new(title: params[:title], password: params[:password])

 if @party.save
    @party.save
    session[:party_id] = @party.id
    redirect "/parties/#{session[:party_id]}"
  else
    @error = "Invalid Input"
    erb :'parties/new'
  end

end

get '/parties/:id/show' do
  erb :'/parties/show'
end


post '/parties/login' do

  @temp_party = Party.find(params[:party_id])

  if @temp_party.authenticate(params[:password])
    session[:party_id] = @temp_party.id
    UserParty.find_or_create_by(user_id: current_user.id, party_id: current_party.id)  # will find the user join table or create it
    redirect "/parties/#{@temp_party.id}/show"
  else
    @error = "Password is not correct"
    erb :index
  end

end







