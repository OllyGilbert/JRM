class StoriesController < ApplicationController
  respond_to :html, :json

  before_filter :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.all
    respond_with(@stories)
  end

  def show
    @story = Story.find(params[:id])
    @commentable = @story
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @story = Story.new
    respond_with(@story)
  end

  def edit
  end

  def create
    @story = Story.new(params[:story])
    @story.save
    respond_with(@story)
  end

  def update
    @story.update_attributes(params[:story])
    respond_with(@story)
  end

  def destroy
    @story.destroy
    respond_with(@story)
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end
end
