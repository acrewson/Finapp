class ExpensesController < ApplicationController


  # This shows the expenses on the log
  def index
    if params[:date] == "cash"
      @expenses = Log.find_by(:id => params[:log_id]).expenses.order(:date_cash).select("id, log_id, description, amount, date(date_cash) as date_show, category_id, deprec_months, method_id, user_id, is_outlier")

      @dates = Log.find_by(:id => params[:log_id]).expenses.select("date(date_cash) as 'date_show', sum(amount) as date_amount").group("date_show").order("date_show")

    else
      @expenses = Log.find_by(:id => params[:log_id]).expenses.order(:date_expense).select("id, log_id, description, amount, date(date_expense) as date_show, category_id, deprec_months, method_id, user_id, is_outlier")

      @dates = Log.find_by(:id => params[:log_id]).expenses.select("date(date_expense) as date_show, sum(amount) as date_amount").group("date_show").order("date_show")
    end


  end




  # For creating a new expense on the log
  def new
    @categories = Log.find_by(:id => params[:log_id]).categories
    @pmethods = Log.find_by(:id => params[:log_id]).payment_methods
  end

  # To save a new expense to the database
  def create
    exp = Expense.new
    exp.log_id = params[:log_id]
    exp.description = params[:description]
    exp.amount = params[:amount]
    exp.date_cash = params[:cashdate]
    exp.date_expense = params[:expensedate]
    exp.category_id = params[:category]
    exp.deprec_months = params[:deprec]
    exp.method_id = params[:pmeth]
    exp.user_id = params[:log_id]
    exp.is_outlier = params[:isout]
    exp.save
    # NOTE: need to put logic around these about how to handle when blank

    redirect_to "/logs/#{params[:log_id]}/expenses"

  end




end
