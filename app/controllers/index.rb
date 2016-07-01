get '/' do

  # Look in app/views/index.erb
  redirect '/users'
end

# <%= erb :_task, layout: false, locals: { x: task} %>
# Partial to use later in User INDEX
