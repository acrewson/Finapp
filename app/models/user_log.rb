class UserLog < ActiveRecord::Base

  belongs_to :user
  belongs_to :log

end
