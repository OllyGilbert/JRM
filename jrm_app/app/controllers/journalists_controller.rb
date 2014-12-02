class JournalistsController < ApplicationController
  before_filter :set_journalist, only: [:show, :edit, :update, :destroy]

  def index
    @journalists = Journalist.all
    respond_with(@journalists)
  end

  def show
    respond_with(@journalist)
  end

  def new
    @journalist = Journalist.new
    respond_with(@journalist)
  end

  def edit
  end

  def create
    @journalist = Journalist.new(params[:journalist])
    @journalist.save
    respond_with(@journalist)
  end

  def update
    @journalist.update_attributes(params[:journalist])
    respond_with(@journalist)
  end

  def destroy
    @journalist.destroy
    respond_with(@journalist)
  end

  private
    def set_journalist
      @journalist = Journalist.find(params[:id])
    end
end
