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
    params.require(:individual).permit(:first_name, :last_name, :birth_date, :phone_number, :title)
  end
end
