class BillsController < ApplicationController

def index
    @bills = Bill.all
  end

  def new
    @utilities = Utility.all
    @bill = Bill.new
  end

  def edit
    @utilities = Utility.all
    @bill = Bill.find(params[:id])
  end

  def show
     @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.find(params[:id])

    if @bill.update(bill_params)
      flash[:notice] = "bill updated successfully!"
      redirect_to bill_path(@bill)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @bill = Bill.new(bill_params)

    if @bill.save
      flash[:notice] = "bill created successfully"
      redirect_to bill_path(@bill)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    bill=Bill.find(params[:id])
    bill.destroy

    flash[:warning] = "bill deleted, fight the power!"
    redirect_to bills_path

  end


private
  def bill_params
    params.require(:bill).permit(:amount, :due_on, :utility_id)
  end

end




