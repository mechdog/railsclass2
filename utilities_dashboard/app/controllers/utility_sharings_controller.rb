class UtilitySharingsController < ApplicationController
  respond_to :html

  def index
    @utility_sharings = current_user.utility_sharings

    respond_with @utility_sharings
  end

  def new
    @users = Users.all
    @utilities = current_user.utilities
    @utility_sharing = current_user.utility_sharings.new

    respond_with @utility_sharing
  end

  def create
    @utility_sharing = current_user.utilities.new(utility_sharing_params)

    flash[:success] = 'Utility shared' if @utility_sharing.save
    respond_with @utility_sharing, location: utility_sharing_path
  end

  def destroy
    @utility_sharing = current_user.utility_sharings.find(params[:id])
    @utility_sharing.destroy

    flash[:success] = 'Utlity unshared' if @utility_sharing.destroyed?
    respond_with @utility_sharing
  end

  private

  def utility_sharing_params
    params[:utility_sharing].permit(:utility_id, :user_id, :permission_level)
  end
end
