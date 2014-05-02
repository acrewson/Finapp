class Expense < ActiveRecord::Base

belongs_to :log
belongs_to :category

end
