class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    #Instance level variable
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # @article = Article.new
    # @article.title = params[:article][:title]
    # @article.body = params[:article][:body]
    #This is the same as

    # @article = Article.new(
    #   title: params[:article][:title],
    #   body: params[:article][:body])
    #Which is the same as:

    #BUT For security reasons this is not a good idea... check method
    #in articles_helper.rb
    #@article = Article.new(params[:article])
    #After including ArticlesHelper...
    @article = Article.new(article_params)

    flash.notice = "Article '#{@article.title}' Created!! Just like Jesus :)"

    @article.save
    redirect_to article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"
  
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.destroy(params[:id])

    flash.notice = "Article '#{@article.title}' DESTROYED! mwahaha"
    redirect_to articles_path(@article)
  end


  def show
    @article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article.id

  end
end
