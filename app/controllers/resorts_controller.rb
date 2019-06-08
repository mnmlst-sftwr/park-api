class ResortsController < ApplicationController
  before_action :set_resort, only: [:show]

  # GET /resorts
  def index
    @resorts = Resort.all

    render json: @resorts
  end

  # GET /resorts/1
  def show
    render json: @resort.as_json(:include => {:parks => {:methods => [:url, :resort_name], :only => [:name]}})
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resort
      @resort = Resort.find_by_slug(params[:slug])
    end
end
