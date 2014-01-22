class UtilitiesController < ApplicationController

# protect_from_forgery with: :null_session, only: :create # Ignores CSRF token
before_filter :authenticate_user!

respond_to :html, :json

  def index
    @utilities = current_user.utilities.all

    respond_with @utilities
  end

  def new
    @utility = current_user.utilities.new
  end

  def edit
    @utility = current_user.utilities.find(params[:id])
  end

  def show
    @utility = current_user.utilities.find(params[:id])

    respond_with @utility
  end

  def update
    @utility = current_user.utilities.find(params[:id])

    flash[:notice] = "Utility updated successfully" if @utility.update(utility_params)
    respond_with @utility 
  end

  def create
    @utility = current_user.utilities.new(utility_params)

    flash[:notice] = "Utility created successfully" if @utility.save
    respond_with @utility     
  end

  def destroy
    @utility=current_user.utilities.find(params[:id])
    @utility.destroy

    flash[:success] = "Utility deleted, fight the power!" if @utility.destroyed?
    respond_with @utility
  end


private
  def utility_params
    params.require(:utility).permit(:name)
  end

end

