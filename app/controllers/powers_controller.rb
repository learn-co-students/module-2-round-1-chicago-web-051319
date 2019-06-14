class PowersController < ApplicationController
  def index
    @powers = Power.all
    @heroines = Heroine.all
  end

  def show
    @power = Power.all.find_by(id: params[:id])
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.new(power_params)
    if @power.save
      redirect_to powers_path(@power)
    else
      @errors = Power.errors.full_messages
      render :new
    end
  end

  private

  def power_params
    params.require(:power).permit(:name, :description)
  end
end
