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

  @current_party = Party.find(session[:party_id])

  @guest_list = Party.find(session[:party_id]).users

  erb :'/parties/show'
end


post '/parties/login' do

  @temp_party = Party.find(params[:party_id])

  if @temp_party.authenticate(params[:password])
    session[:party_id] = @temp_party.id
    if UserParty.find_or_create_by(user_id: current_user.id, party_id: session[:party_id])  # will find the user join table or create it
      UserParty.find_or_create_by(user_id: current_user.id, party_id: session[:party_id])
    else
      erb :index
    end

    redirect "/parties/#{@temp_party.id}/show"
  else
    @error = "Password is not correct"
    erb :index
  end

end


get '/parties/show/ok' do

  @current_party = Party.find(session[:party_id])

  @guest_list = Party.find(session[:party_id]).users  # Consider using a helper files

  @murder_array = UserParty.where(party_id: session[:party_id])

  @murderer = @murder_array.shuffle.pop

  @murderer.murderer = true

  @murderer.save

  erb :'/parties/show'

end

post '/parties/:id/show' do
  redirect '/parties/show'
end



post '/parties/show/ok' do

@vote_array = UserParty.where(party_id: session[:party_id], user_id: session[:user_id]).first
@vote_array.voted = 0
@vote_array.save

# @votehold = current_user.user_parties.find_by(user_id: current_user.id, party_id: session[:party_id]).voted = 0
# @votehold.save
  redirect '/parties/show/ok'
end


















