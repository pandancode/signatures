class ContractsController < ApplicationController
  def index
    #if the current user role is a company
    if current_user.role == "Company"
      #display all the contract where company_id 
      # @company = current_user.company
      # @contracts = @company.contracts  current_user.company
      @contracts = Contract.where(company_id: current_user.company)
      #else 
    else
      #display all contract where individual_id
      # @individual = current_user.individual
      # @contracts = @individual.contracts   
      @contracts = Contract.where(individual_id: current_user.individual)      
    end    
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def new

  end

  def create

  end

  private

  def contract_params

  end
end
