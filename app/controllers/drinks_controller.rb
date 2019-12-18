class DrinksController < ApplicationController
  
  def index
    # will have template
    @drinks = Drink.all
  end
  
  def show
    # will have template
    @drink = Drink.find(params[:id])
  end
  
  def new # display the form for the new record
    # will have template
    @drink = Drink.new
  end
  
  def create # save new record
    # will save and redirect
    @drink = Drink.new(allowed_params)

    if @drink.save
      redirect_to drinks_path
    else
      render 'new'
    end

  end
  
  def edit # display form for existing record
    # will have template
    @drink = Drink.find(params[:id])
  end

  def update # save changes
    # will sabe and redirect
    @drink = Drink.find(params[:id])
    if @drink.update_attributes(allowed_params)
      redirect_to drinks_path
    else
      render 'new'
    end

  end

  def destroy
    # will destroy and redirect
    @drink = Drink.find(params[:id])
    @drink.destroy
    redirect_to drinks_path
  end

  private
    def allowed_params
      params.require(:drink).permit(:name, :size)
    end

end
