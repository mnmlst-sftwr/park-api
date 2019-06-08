class EntertainmentsController < ApplicationController
  before_action :set_attraction, only: [:show]

  # GET resorts/:resort_slug/:slug
  def show
    render json: @entertainment
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      resort = Resort.find_by_slug(params[:resort_slug])
      park = resort.parks.find_by_slug(params[:park_slug])
      @entertainment = park.entertainments.find_by_slug(params[:slug])
    end
end
