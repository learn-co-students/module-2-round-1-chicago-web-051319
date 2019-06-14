class HeroinesController < ApplicationController
  before_action :all_methods

  def index

  end

  def show
    @heroine = Heroine.find_by(id: params[:id])
    @power = @heroine.power
  end

  def new
    @heroine = Heroine.new
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

  def search
    @power = Power.find_by(name: params[:name])
    if @power
      @heroines = Heroine.where(power_id: @power.id)      
    end
    render :index
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name,:super_name,:power_id)
  end

  def all_methods
    @powers = Power.all
    @heroines = Heroine.all
  end
end
