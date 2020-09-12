class ArticlesController < ApplicationController

  def index
    #Instance level variable
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
