class BillsController < ApplicationController

respond_to :html, :json

def index
    @bills = Bill.all

    respond_with @bills
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

     respond_with @bill
  end

  def update
    @bill = Bill.find(params[:id])
   
      flash[:notice] = "bill updated successfully!" if @bill.update(bill_params)
      respond_with @bill

  end

  def create
    @bill = Bill.new(bill_params)

    flash[:notice] = "bill created successfully" if @bill.save
     respond_with @bill 

  end

  def destroy
    @bill=Bill.find(params[:id])
    @bill.destroy

    flash[:warning] = "bill deleted, fight the power!" if @bill.destroy?
    respond_with @bill

  end


private
  def bill_params
    params.require(:bill).permit(:amount, :due_on, :utility_id)
  end

end




