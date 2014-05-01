class LogsController < ApplicationController

  before_action :authenticate_user!


  def index
    @logs = Log.joins(:user_logs).where("user_logs.user_id = ? and logs.datedeleted is ?", current_user.id, nil)


  end

end
