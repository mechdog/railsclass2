class HomesController < ApplicationController
  after_filter :verify_policy_scoped

  def show
    # binding.pry
    @utilities = policy_scope(Utility)
    # @bills = Bill.order(:due_on).all
  end
end
