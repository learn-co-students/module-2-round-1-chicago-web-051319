class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find_by(id: params[:id])
  end

  def create
    @heroine = Heroine.new
    @heroine.name = params[:name]
    @heroine.super_name = params[:super_name]
    @heroine.power = Power.all[rand(0..Power.all.length)] #randomized due to a lack of a working dropdown
    #@heroine.power = params[:power]

    @heroine.save
    #redirect_to heroine_path(@heroine)
    #@heroine.save
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      puts "=================INVALID INVALID INVALID ================================"
      render :new
    end
  end

  def new
    @heroine = Heroine.new
  end
end
