class ParksController < ApplicationController
  before_action :set_park, only: [:show]

  # GET resorts/:resort_slug/:slug
  def show
    render json: @park
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_park
      resort = Resort.find_by_slug(params[:resort_slug])
      @park = resort.parks.find_by_slug(params[:slug])
    end
end
