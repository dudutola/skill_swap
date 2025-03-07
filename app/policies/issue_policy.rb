class IssuePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.order(created_at: :desc)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end
  
  def destroy?
    record.user == user
  end


end

