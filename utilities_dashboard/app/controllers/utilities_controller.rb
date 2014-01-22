class UtilitiesController < ApplicationController

  def index
    @utilities = Utility.all
  end

  def new
    @utility = Utility.new
  end

  def edit
    @utility = Utility.find(params[:id])
  end

  def show
     @utility = Utility.find(params[:id])
  end

  def update
    @utility = Utility.find(params[:id])

    if @utility.update(utility_params)
      flash[:notice] = "Utility updated successfully!"
      redirect_to utility_path(@utility)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @utility = Utility.new(utility_params)

    if @utility.save
      flash[:notice] = "Utility created successfully"
      redirect_to utility_path(@utility)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    utility=Utility.find(params[:id])
    utility.destroy

    flash[:warning] = "Utility deleted, fight the power!"
    redirect_to utilities_path

  end


private
  def utility_params
    params.require(:utility).permit(:name)
  end

end

