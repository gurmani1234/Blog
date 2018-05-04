class ArticlesController < ApplicationController

  # before_action :find_article , expect: [:index, :new, :create]

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
    render :edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update

    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy

    @article = Article.find(params[:id])
    @article.destroy
	redirect_to articles_path(@article), notice: "Delete success"
  end

  def find_article
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end


end
