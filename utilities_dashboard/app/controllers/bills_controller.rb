class BillsController < ApplicationController
 after_action :verify_authorized, except: :index
 after_action :verify_scoped, only: :index

respond_to :html, :json

def index
    @bills = current_user.bills.all

    respond_with @bills
  end

  def new
    @utilities = policy_scope(Utility)
    @bill = current_user.bills.new
  end

  def edit
    @utilities = policy_scope(Utility)
    @bill = current_user.bills.find(params[:id])
  end

  def show
     @bill = current_user.bills.find(params[:id])

     respond_with @bill
  end

  def update
    @bill = current_user.bills.find(params[:id])
   
      flash[:notice] = "bill updated successfully!" if @bill.update(bill_params)
      respond_with @bill

  end

  def create
    @bill = current_user.bills.new(bill_params)

    flash[:notice] = "bill created successfully" if @bill.save
    respond_with @bill do |format|
      format.json { render 'show'}
    end

  end

  def destroy
    @bill=current_user.bills.find(params[:id])
    @bill.destroy

    flash[:warning] = "bill deleted, fight the power!" if @bill.destroy?
    respond_with @bill

  end


private
  def bill_params
    params.require(:bill).permit(:amount, :due_on, :utility_id)
  end

end




