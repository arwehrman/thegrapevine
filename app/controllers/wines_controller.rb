class WinesController < ApplicationController

  get '/wines' do
    if logged_in?
      @users_wine = current_user.wines
      erb :'wines/wines'
    else
      redirect to '/login'
    end
  end

  get '/wines/new' do
    if logged_in?
      erb :'wines/create_wine'
    else
      flash[:message] = "You must be logged add a new wine"
      redirect to '/login'
    end
  end

  post '/wines' do
    if logged_in?
      @wine = current_user.wines.build(maker: params[:maker], wine_type: params[:wine_type], vintage: params[:vintage], price: params[:price], rating: params[:rating], region: params[:region])
      if @wine.save
        redirect to '/wines'
      else
        redirect to '/wines/new'
      end
    else
      redirect to '/login'
    end
  end

  get '/wines/:id' do
    if logged_in?
      @wine = Wine.find_by_id(params[:id])
      erb :'wines/show_wine'
    else
      redirect to '/login'
    end
  end

  get '/wines/:id/edit' do
    @wine = Wine.find_by_id(params[:id])
    if logged_in? && @wine.user_id == current_user.id
        erb :'wines/edit_wines'
    else
      redirect to '/login'
    end
  end

  patch '/wines/:id' do
    if params[:maker] == ""
      redirect to "/wines/:id/edit"
    else
      @wine = Wine.find_by_id(params[:id])
      @wine.update(maker: params[:maker], wine_type: params[:wine_type], vintage: params[:vintage], price: params[:price], rating: params[:rating], region: params[:region])
      redirect to "/wines/#{params[:id]}"
    end
  end

  delete '/wines/:id/delete' do
    @wine = Wine.find_by_id(params[:id])
    if logged_in? && @wine.user_id == current_user.id
        @wine.destroy
        flash[:message] = "The wine has been removed from your Grapevine"
        redirect to '/wines'
      else
        redirect to '/login'
    end
  end
end
