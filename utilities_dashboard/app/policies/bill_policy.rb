class BillPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.where(utility_id: Pundit.policy_scope(user, Utility))
    end
  end

end
