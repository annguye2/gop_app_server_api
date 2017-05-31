class ShareprojectsController < ApplicationController
  before_action :set_shareproject, only: [:show, :update, :destroy]

  # GET /shareprojects
  def index
    @shareprojects = Shareproject.all

    render json: @shareprojects
  end

  # GET /shareprojects/1
  def show
    render json: @shareproject
  end

  # POST /shareprojects
  def create
    @shareproject = Shareproject.new(shareproject_params)

    if @shareproject.save
      render json: @shareproject, status: :created, location: @shareproject
    else
      render json: @shareproject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shareprojects/1
  def update
    if @shareproject.update(shareproject_params)
      render json: @shareproject
    else
      render json: @shareproject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shareprojects/1
  def destroy
    @shareproject.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shareproject
      @shareproject = Shareproject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shareproject_params
      params.require(:shareproject).permit(:name, :creator, :description, :comment, :feature_url, :category)
    end
end
