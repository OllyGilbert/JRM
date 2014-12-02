class NotesController < ApplicationController
  respond_to :html, :json

  before_filter :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
    respond_with(@notes)
  end

  def show
    respond_with(@note)
  end

  def new
    @note = Note.new
    respond_with(@note)
  end

  def edit
  end

  def create
    @note = Note.new(params[:note])
    @note.save
    respond_with(@note)
  end

  def update
    @note.update_attributes(params[:note])
    respond_with(@note)
  end

  def destroy
    @note.destroy
    respond_with(@note)
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end
end
