class CommentsController < ApplicationController

  #How do we define a comment create? We need to make sure we have the same article_id!!!
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save
    redirect_to article_path(@comment.article)
  end


  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
  
end
