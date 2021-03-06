class DosesController < ApplicationController
  before_action :find_cocktail, except: :destroy

  # def new
  #   @dose = Dose.new
  # end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      # @review = Review.new
      # render 'new'
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
    # params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
