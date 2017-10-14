class WinesController < ApplicationController

  get '/wines' do
    if logged_in?
      @wines = Wine.all
      erb :'wines/show_wines'
    else
      redirect to '/login'
    end
  end

  get '/wines/new' do
    if logged_in?
      erb :'wines/create_wine'
    else
      redirect to '/login'
    end
  end

  post '/wines' do
    @wine = current_user.wine.create(params)
    redirect to '/wines'
  end


end
