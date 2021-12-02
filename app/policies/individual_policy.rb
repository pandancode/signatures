class IndividualPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def new?
    return true
  end

  def create?
    new?
  end

  def show?
    record == user.individual
  end

  def edit?
    record == user.individual
  end

  def update?
    edit?
  end
end
