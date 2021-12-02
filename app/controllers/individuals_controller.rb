class IndividualsController < ApplicationController
  def new
    @individual = Individual.new
    authorize @individual
  end

  def create
    @individual = Individual.new(individual_params)
    authorize @individual
    @user = current_user
    @individual.user = @user
    if @individual.save
      redirect_to unsigned_path
    else
      render :new
    end
  end

  def show
    @individual = Individual.find(params[:id])
    authorize @individual
  end

  def edit
    @individual = Individual.find(params[:id])
    authorize @individual
  end

  def update
    @individual = Individual.find(params[:id])
    authorize @individual
    @individual.update(individual_params)
    redirect_to individual_path(current_user.individual)
  end

  private

  def individual_params
    params.require(:individual).permit(:first_name, :last_name, :birth_date, :phone_number, :title, :signature)
  end
end
