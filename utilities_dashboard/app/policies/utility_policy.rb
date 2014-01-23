class UtilityPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.present?
        scope.where(id: user.utilities + user.shared_utilities)
      else
        scope.none
      end
    end
  end

  def show?
    record.user == user || UtilitySharing.where(utility: record, user: user).exists?
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end
