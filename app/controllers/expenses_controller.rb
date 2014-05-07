class ExpensesController < ApplicationController


  # This shows the expenses on the log
  def index
    @expenses = Log.find_by(:id => params[:log_id]).expenses
  end

  # For creating a new expense on the log
  def new
    @categories = Log.find_by(:id => params[:log_id]).categories
    @pmethods = Log.find_by(:id => params[:log_id]).payment_methods
  end


end
