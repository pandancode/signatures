class IndividualsController < ApplicationController
  def new
    @individual = Individual.new
  end

  def create
    @individual = Individual.new(individual_params)
    @user = current_user
    if @individual.save
      redirect_to individual_path(@individual)
    else
      render :new
    end
  end

  def show
    @individual = Individual.find(individual_params)
  end

  def edit
  end

  def update
    @individual = Individual.find(params[:id])
    @individual.update(individual_params)
  end

private

  def individual_params
    params.require(:individual).permit(:first_name, :last_name, :birth_date, :phone_number, :title)
  end
end