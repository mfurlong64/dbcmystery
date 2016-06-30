get '/users' do
  @users = User.all #define instance variable for view
  @parties = Party.all
  @current_user = nil
  if session[:user_id]
    @current_user = User.find(session[:user_id])    # Finds the current user if active
  end
  erb :'users/index' #show all users view (index)
end

post '/users' do
  # consider add error handling'

  @error = nil
  @user = User.new(email: params[:email],password: params[:password])
  @user_copy = User.find_by(email:@user.email)

  if @user.save
    @user.save
    session[:user_id] = @user.id
    redirect '/users/#{@user.id}'
  else
    @error = "Sorry this email has already been taken"
    erb :'users/new'
  end

end

post '/users/login' do

  @temp_user = User.find_by(email:params[:email])

  if @temp_user.authenticate(params[:password])
    session[:user_id] = @temp_user.id
    redirect "/users/#{@temp_user.id}"
  else
    erb :index    # need to find a better route if mistakes were made
  end
end

get '/users/login' do
  erb :'users/login'
end

get '/users/new' do
  erb :'users/new'
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end
