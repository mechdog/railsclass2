class HomesController < ApplicationController
  def show
    @utilities = current_user.utilities.all if user_signed_in?
    # @bills = Bill.order(:due_on).all
  end
end
