class UsersController < ApplicationController

  get "/signup" do
  		erb :'users/signup'
  	end

  	post "/signup" do
  		user = User.new(:username => params[:username], :password => params[:password])
  		if user.save
  			redirect 'users/login'
  		else
  			redirect '/failure'
  		end
  	end

    get '/login' do
      erb :'users/login'
    end
    
end
