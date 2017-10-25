class CommentsController < ApplicationController

  post '/wines/:wine_id/comments' do
    @wine = Wine.find_by(id: params[:wine_id])
    @comment = @wine.comments.build(content: params[:content])
    @comment.save
    redirect back
  end

  delete '/wines/:wine_id/comments/:id' do
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect back
  end

end
