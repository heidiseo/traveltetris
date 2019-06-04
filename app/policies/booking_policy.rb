class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user: user)
    end
  end

  def show?
    true
  end

  def update?
    show?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
