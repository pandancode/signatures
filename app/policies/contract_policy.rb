class ContractPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def show?
    record.company == user.company || record.individual == user.individual
  end

  def new?
    return true
  end

  def create?
    new?
  end

  def sign?
    record.individual == user.individual
  end

  def signed?
    return true
  end

  def unsigned?
    signed?
  end
end
