class PublishersController < ApplicationController
  before_filter :set_publisher, only: [:show, :edit, :update, :destroy]

  def index
    @publishers = Publisher.all
    respond_with(@publishers)
  end

  def show
    respond_with(@publisher)
  end

  def new
    @publisher = Publisher.new
    respond_with(@publisher)
  end

  def edit
  end

  def create
    @publisher = Publisher.new(params[:publisher])
    @publisher.save
    respond_with(@publisher)
  end

  def update
    @publisher.update_attributes(params[:publisher])
    respond_with(@publisher)
  end

  def destroy
    @publisher.destroy
    respond_with(@publisher)
  end

  private
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end
end
