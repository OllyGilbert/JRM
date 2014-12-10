class MediaListsController < ApplicationController
  respond_to :html, :json

  before_filter :set_media_list, only: [:show, :edit, :update, :destroy]

  def index
    @media_lists = MediaList.all
    respond_with(@media_lists)
  end

  def show
    respond_with(@media_list)
  end

  def new
    @media_list = MediaList.new
    respond_with(@media_list)
  end

  def edit
  end

  def create
    @media_list = MediaList.new(params[:media_list])
    @media_list.save
    respond_with(@media_list)
  end

  def update
    @media_list.update_attributes(params[:media_list])
    respond_with(@media_list)
  end

  def destroy
    @media_list.destroy
    respond_with(@media_list)
  end

  private
    def set_media_list
      @media_list = MediaList.find(params[:id])
    end
end
