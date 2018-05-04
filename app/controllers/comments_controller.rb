class CommentsController < ApplicationController

  def index
    @title = "All comments"
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save
    redirect_to article_path(@comment.article)
  end
  def show
    @comment.article_id = Comment.find(params[:article_id])

  end

  def new
    @article = Article.find_by_id params[:article_id]
    @comment = Comment.new
  end

  def destroy

    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(@comment.article)
  end

  def comment_params
    #   debugger
    params.require(:comment).permit(:author_name, :body, :article)
  end
end
