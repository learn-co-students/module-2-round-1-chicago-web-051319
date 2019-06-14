class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show]
  
  def index
    @powers = Power.all
    if params[:search]
      @heroines = Heroine.search(params[:search])
      if !Power.find_by(name: params[:search])
        @apology = "That superpower does not exist in our database. All heroines, unfiltered, are listed below:"
      end
    else
      @heroines = Heroine.all
    end
  end

  def show
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
      @powers = Power.all
      render :new
    end
  end

  private

  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :search)
  end
end
