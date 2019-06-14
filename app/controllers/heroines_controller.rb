class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    # @heroine = Heroine.new(heroine_params)
  end

  def create
    @heroine = Heroine.find(params[:id])
    @heroine = Heroine.new(heroine_params)
    @heroine.save
    redirect_to heroines_path(@heroine)
  end

  def edit
    @heroine = Heroine.find(params[:id])
  end

  def update
    @heroine = Heroine.find(params[:id])
    @heroine.update(heroine_params)
    redirect_to heroines_path(@heroine)
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power)
  end

end
