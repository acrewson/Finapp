class ExpensesController < ApplicationController


  # This shows the expenses on the log
  def index
    @expenses = Log.find_by(:id => params[:log_id]).expenses.order(:date_cash)
    @dates = @expenses.select("date_cash, sum(amount) as date_amount").group("date_cash").order(:date_cash)

  end

  # For creating a new expense on the log
  def new
    @categories = Log.find_by(:id => params[:log_id]).categories
    @pmethods = Log.find_by(:id => params[:log_id]).payment_methods
  end


end
