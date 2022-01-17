class OverdraftsController < ApplicationController
  before_action :set_overdraft, only: %i[ show ]

  # GET /overdraft/1 or /overdraft/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overdraft
      @overdraft = Overdraft.find(params[:id])
    end

end
