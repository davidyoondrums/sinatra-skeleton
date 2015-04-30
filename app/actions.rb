# Homepage (Root path)
helpers do
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
  def num_to_catagory(i)
    ["Wedding Stationaries", "Brooch Accessories","Wedding Accesories", "Party Invitation" ][i]
  end

end

get '/' do
  if id = params[:id]
    redirect "/products/#{id}"
  else
    erb :index
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  username = params[:username]
  password = params[:password]
  email = params[:email]
  firstname = params[:firstname]
  lastname = params[:lastname]


  user = User.find_by(username: username)
  if user
    redirect '/login'
  else
    user = User.create(username: username, password: password, email: email, firstname: firstname, lastname: lastname)
    session[:user_id] = user.id
    redirect '/'
  end
end


get '/login' do
  # user data
  # finding user by email
  # check the password
  # if it matches, redirect

  # redirect '/'
    erb :login
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  
  if User.exists?(username: username) && user.password == password
    session[:user_id] = user.id
    redirect '/products/new'
  else
    redirect '/login'
  end
end



get '/products/new' do
  # find all products
  # loop through products in erb, display relevant info
  erb :'products/new'
end

post '/products' do  
  name = params[:name]
  explanation = params[:explanation]
  catagory = params[:catagory]
  image_url = params[:image_url]

  new_product = current_user.products.create(name: name, explanation: explanation, catagory: catagory, image_url: image_url)
  

  redirect "/products/#{new_product.id}"
end

get '/products/show' do
  erb :'products/show'
end

get '/products/edit' do 
  erb :'products/edit'
end

get '/logout' do
  erb :logout
end

get '/products/:id' do
  @product = Product.find_by(id: params[:id])

  if @product
    erb :'products/edit'
  else
    redirect '/'
  end
end

