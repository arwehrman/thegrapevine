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
      @wine = current_user.wines.create(maker: params[:maker], wine_type: params[:wine_type], vintage: params[:vintage], price: params[:price], rating: params[:rating], region: params[:region])
      @wine.user_id = @current_user.id
      @wine.save
      redirect to '/wines'
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
    if logged_in?
      @wine = Wine.find_by_id(params[:id])
      if @wine.user_id == current_user.id
        erb :'wines/edit_wines'
      else
        redirect to '/wines'
      end
    else
      redirect to '/login'
    end
  end

  

  delete '/wines/<%=@wine.id%>/delete' do
    if logged_in?
      @wine = Wine.find_by_id(params[:id])
      if @wine.user_id == current_user.id
        @wine.delete
        redirect to '/wines'
      else
        redirect to '/wines'
      end
    else
        redirect to '/login'
    end
  end

end
