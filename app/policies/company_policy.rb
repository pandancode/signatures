class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def create?
    return true
  end

  def show?
    record == user.company
  end

  def edit?
    record == user.company
  end

  def update?
    edit?
  end
end
