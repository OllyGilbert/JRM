class CommentsController < ApplicationController
  respond_to :html, :json

  before_filter :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.save
    respond_with(@comment)
  end

  def update
    @comment.update_attributes(params[:comment])
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
end
