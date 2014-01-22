class HomesController < ApplicationController
  def show
    @utilities = Utility.all
    # @bills = Bill.order(:due_on).all
  end
end
