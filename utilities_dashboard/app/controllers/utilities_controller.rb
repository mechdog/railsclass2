class UtilitiesController < ApplicationController

# protect_from_forgery with: :null_session, only: :create # Ignores CSRF token

respond_to :html, :json

  def index
    @utilities = Utility.all

    respond_with @utilities
  end

  def new
    @utility = Utility.new
  end

  def edit
    @utility = Utility.find(params[:id])
  end

  def show
    @utility = Utility.find(params[:id])

    respond_with @utility
  end

  def update
    @utility = Utility.find(params[:id])

    flash[:notice] = "Utility updated successfully" if @utility.update(utility_params)
    respond_with @utility 
  end

  def create
    @utility = Utility.new(utility_params)

    flash[:notice] = "Utility created successfully" if @utility.save
    respond_with @utility     
  end

  def destroy
    @utility=Utility.find(params[:id])
    @utility.destroy

    flash[:success] = "Utility deleted, fight the power!" if @utility.destroyed?
    respond_with @utility
  end


private
  def utility_params
    params.require(:utility).permit(:name)
  end

end

