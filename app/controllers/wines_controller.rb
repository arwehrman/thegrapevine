class WinesController < ApplicationController

  get '/wines' do
    if logged_in?
      @wines = Wine.all
      erb :'wines/wines'
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
    if logged_in?
    @current_user = current_user
    @wine = current_user.wines.create(name: params[:name], maker: params[:maker], wine_type: params[:wine_type], vintage: params[:vintage], price: params[:price], rating: params[:rating], region: params[:region])
    @wine.user_id = @current_user.id
    @wine.save
    redirect to '/wines'
  else
    redirect to '/login'
  end
end


end
