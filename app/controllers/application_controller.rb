require './config/environment'

class ApplicationController < Sinatra::Base

  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "winesecret"

  end

  get "/" do
    erb :index
  end

  helpers do
     def logged_in?
       !!session[:user_id]
     end

     def current_user
        @current_user ||= User.find_by(id: session[:user_id])
     end
   end
end
