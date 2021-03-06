class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: %i[show edit update destroy]

  def index
    @suggestions = Suggestion.all
  end

  def show; end

  def new
    @suggestion = Suggestion.new
  end

  def edit; end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to suggestion_url(@suggestion), notice: 'Suggestion was successfully created.' }

      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @job = params[:answer]
    respond_to do |format|
      if params[:answer] == 'accepted'
        @suggestion.update(accepted: true)
        if @suggestion.pair_suggestion.accepted
          @suggestion.update(refused: false)
          @suggestion.pair_suggestion.update(refused: false)
        end
      else
        @suggestion.update(refused: true)
        @suggestion.pair_suggestion.update(refused: true)
      end
      format.html { redirect_to user_connections_path(current_user), notice: 'Suggestion was successfully updated.' }
      format.js {}
    end

  end


  def destroy
    @suggestion.destroy

    respond_to do |format|
      format.html { redirect_to suggestions_url, notice: 'Suggestion was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def suggestion_params
    params.require(:suggestion).permit(:partner_id, :accepted, :refused)
  end
end
