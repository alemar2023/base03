class AreaLabelsController < ApplicationController
  before_action :set_area
  before_action :set_area_label, only: %i[show edit update destroy]

  def show

  end

  def destroy

  end

  def new
    @area_label = AreaLabel.new
  end

  def create
    @area_label = AreaLabel.new(area_label_params)
    respond_to do |format|
      if @area_label.save
        format.html { redirect_to area_path(@area), notice: "Area Label was successfully created." }
        format.json { render :show, status: :created, location: @area_label }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @area_label.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  private

  def set_area
    @area = Area.find(params[:blueprint_id])
  end

  def set_area_label
    @area_label = AreaLabel.find(params[:id])
  end

  def area_label_params
    params.require(:area_label).permit(:area_id, :name, :locale)
  end
end