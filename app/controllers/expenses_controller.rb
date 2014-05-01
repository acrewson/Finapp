class ExpensesController < ApplicationController

  def index
    @expenses = Log.find_by(:id => params[:log_id]).items

  end




end
