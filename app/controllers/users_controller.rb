class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
    erb :'users/signup'
    else
    redirect to :'/wines'
    end
  end

  post '/signup' do
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/wines'
    else
      flash[:message] = @user.errors.full_messages.join(', ')
      redirect to '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/wines'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to "/wines"
    else
      flash[:message] = "You must have an account to log in. If you have an account please select Login to be redirected back to login page"
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      flash[:message] = "You have successfully logged out"
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
