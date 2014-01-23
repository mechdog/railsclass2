class UtilitiesController < ApplicationController
 after_action :verify_authorized, except: :index
 after_action :verify_scoped, only: :index

# protect_from_forgery with: :null_session, only: :create # Ignores CSRF token
before_filter :authenticate_user!

respond_to :html, :json

  def index
    @utilities = policy_scope(Utility)

    respond_with @utilities
  end

  def new
    @utility = current_user.utilities.new

    authorize @utility
  end

  def edit
    @utility = Utility.find(params[:id])

    authorize @utility

  end

  def show
    @utility = Utility.find(params[:id])

    authorize @utility

    respond_with @utility
  end

  def update
    @utility = Utility.find(params[:id])

    authorize @utility

    flash[:notice] = "Utility updated successfully" if @utility.update(utility_params)
    respond_with @utility 
  end

  def create
    @utility = current_user.utilities.new(utility_params)

    flash[:notice] = "Utility created successfully" if @utility.save
    respond_with @utility     
  end

  def destroy
    @utility=Utility.find(params[:id])

    authorize @utility
    
    @utility.destroy

    flash[:success] = "Utility deleted, fight the power!" if @utility.destroyed?
    respond_with @utility
  end


private
  def utility_params
    params.require(:utility).permit(:name)
  end

end

