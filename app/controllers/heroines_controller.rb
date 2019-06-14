class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    @powers = Power.all
  end

  def show
    @heroine = Heroine.find_by(params[:id])
    @heroine_power = @heroine.power
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      @errors = @heroine.errors.full_messages
      render :new
    end
  end

  def edit
    @heroine = Heroine.find_by(params[:id])
  end

  def update
    @heroine = Heroine.find_by(params[:id])
    @heroine.update(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      @errors = @heroine.errors.full_messages
      render :new
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
