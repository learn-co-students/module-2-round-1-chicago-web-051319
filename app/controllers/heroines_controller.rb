class HeroinesController < ApplicationController
  def index
    if params[:power]
      @Heroine = Heroine.where('power LIKE ?', "%#{params[:power]}%")
    else
      @heroines = Heroine.all
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
   @heroine = Heroine.new(heroine_params)
   @powers= Power.all
   if @heroine.save
     redirect_to heroine_path(@heroine)
   else
     @errors = @heroine.errors.full_messages
     render :new
   end
  end

private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :power)
  end

end
