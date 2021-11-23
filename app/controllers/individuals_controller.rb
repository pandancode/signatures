class IndividualsController < ApplicationController
  def show
    @individual = Individual.find(individual_params)
  end

  def update
    @individual = Individual.find(params[:id])
    @individual.update(individual_params)
    redirect_to individual_path(@individual)
  end

private

  def individual_params
    params.require(:individual).permit(:fully_signed_at)
  end
end
