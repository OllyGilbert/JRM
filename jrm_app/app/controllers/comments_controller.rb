class CommentsController < ApplicationController
  respond_to :html, :json

  before_filter :load_commentable
  
  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to @commentable, notice: "Comment created."
        end
        format.json { render json: @comment.to_json, status: :precondition_failed }
      else
        format.html do
          flash[:success] = "comment created"
        end
        format.json 
      end
    end
  end

private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

end
