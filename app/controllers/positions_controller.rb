class PositionsController < ApplicationController
  before_filter :set_position, only: [:show, :edit, :update, :destroy]

  def index
    @positions = Position.all
    respond_with(@positions)
  end

  def show
    respond_with(@position)
  end

  def new
    @position = Position.new
    respond_with(@position)
  end

  def edit
  end

  def create
    @position = Position.new(params[:position])
    @position.save
    respond_with(@position)
  end

  def update
    @position.update_attributes(params[:position])
    respond_with(@position)
  end

  def destroy
    @position.destroy
    respond_with(@position)
  end

  private
    def set_position
      @position = Position.find(params[:id])
    end
end
