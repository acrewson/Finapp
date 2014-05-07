class Log < ActiveRecord::Base

  has_many :user_logs
  has_many :expenses
  has_many :categories
  has_many :payment_methods





end
