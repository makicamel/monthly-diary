class NotesController < ApplicationController
  skip_before_action :authenticate, only: [:index]

  def index
    @notes = current_user.notes
  end

  def create
    current_user.notes.create!(notes_params)
    redirect_to notes_path
  end

  private

  def notes_params
    params.require(:note).permit(:contents)
  end
end
