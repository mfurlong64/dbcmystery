get '/users' do
  @users = User.all #define instance variable for view
  @current_user = nil
  if session[:user_id]
    @current_user = User.find(session[:user_id])    # Finds the current user if active
  end
  erb :'users/index' #show all users view (index)
end

get '/users/login' do
  erb :'users/login'
end

get '/users/new' do
  "Hello World"
end
