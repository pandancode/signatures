class IndividualsController < ApplicationController
  def new
    @individual = Individual.new
  end

  def create
    @individual = Individual.new(individual_params)
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
  end

  def edit
    @individual = Individual.find(params[:id])
  end

  def update
    @individual = Individual.find(params[:id])
    @individual.update(individual_params)
    redirect_to unsigned_path
  end

  private

  def individual_params
    params.require(:individual).permit(:first_name, :last_name, :birth_date, :phone_number, :title, :signature)
  end
end
