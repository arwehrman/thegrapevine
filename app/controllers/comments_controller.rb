class CommentsController < ApplicationController
  post '/wines/:wine_id/comments' do
    @wine = Wine.find_by(id: params[:wine_id])
    @comment = Comment.new(:content => params[:content])
    @comment.wine_id = @wine
    @comment.save
    redirect back
  end

  delete '/wines/:wine_id/comments/:id' do
    @comment = Comment.find_by(params[:id])
    @comment.destroy
  end

end
