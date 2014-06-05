# require 'Time'

# Create a couple fake users
User.destroy_all

u = User.new
u.email = 'test@gmail.com'
u.password = 'password'
u.password_confirmation = 'password'
u.save


u = User.new
u.email = 'crewdog@gmail.com'
u.password = 'password'
u.password_confirmation = 'password'
u.save

# Create a log
Log.destroy_all

l = Log.new
l.log_name = "Crewson Expenses"
l.main_user_id = User.find_by(:email => "test@gmail.com").id
l.save

# Permission myself to that log
UserLog.destroy_all

ul = UserLog.new
ul.user_id = User.find_by(:email => "test@gmail.com").id
ul.log_id = Log.find_by(:log_name => "Crewson Expenses").id
ul.save



# Create categories for this log
  Category.destroy_all

  ["Dining Out", "Entertainment", "Rent", "Shopping: Clothes", "Shopping: Other"].each do |cat|
    c = Category.new
    c.log_id = Log.find_by(:log_name => "Crewson Expenses").id
    c.name = cat
    c.save
  end


# Create payment method for this log
  PaymentMethod.destroy_all

  ["Venture Card", "Schwab Checking", "BoA Credit", "Chase Freedom", "Cash"].each do |pm|
    p = PaymentMethod.new
    p.log_id = Log.find_by(:log_name => "Crewson Expenses").id
    p.method_name = pm
    p.is_default = 0
    p.save
  end

  p = PaymentMethod.find_by(:log_id => Log.find_by(:log_name => "Crewson Expenses").id, :method_name => "Venture Card")
  p.is_default = 1
  p.save

# Put some expenses on that log
 Expense.destroy_all

 i = [
   {
     :log_id => Log.find_by(:log_name => "Crewson Expenses").id,
     :description => "Basketball",
     :amount => 10.99,
     :date_cash => "4/30/2014",
     :category_id => Category.find_by(:name => "Shopping: Other").id,
     :deprec_months => 0,
     :method_id => PaymentMethod.find_by(:method_name => "Venture Card").id,
     :user_id => User.find_by(:email => "test@gmail.com").id,
     :is_outlier => 0
   },
   {
     :log_id => Log.find_by(:log_name => "Crewson Expenses").id,
     :description => "Amazon Prime subscription",
     :amount => 80,
     :date_cash => "04/15/2014",
     :category_id => Category.find_by(:name => "Shopping: Other").id,
     :deprec_months => 12,
     :method_id => PaymentMethod.find_by(:method_name => "Venture Card").id,
     :user_id => User.find_by(:email => "test@gmail.com").id,
     :is_outlier => 0
   },
   {
     :log_id => Log.find_by(:log_name => "Crewson Expenses").id,
     :description => "Rent",
     :amount => 1300,
     :date_cash => "4/01/2014",
     :category_id => Category.find_by(:name => "Rent").id,
     :deprec_months => 0,
     :method_id => PaymentMethod.find_by(:method_name => "Schwab Checking").id,
     :user_id => User.find_by(:email => "test@gmail.com").id,
     :is_outlier => 0
   },
   {
     :log_id => Log.find_by(:log_name => "Crewson Expenses").id,
     :description => "Snack",
     :amount => 5,
     :date_cash => "4/15/2014",
     :category_id => Category.find_by(:name => "Dining Out").id,
     :deprec_months => 0,
     :method_id => PaymentMethod.find_by(:method_name => "Venture Card").id,
     :user_id => User.find_by(:email => "test@gmail.com").id,
     :is_outlier => 0
   }
 ]

  i.each do |exp|
    e = Expense.new
    e.log_id = exp[:log_id]
    e.description = exp[:description]
    e.amount = exp[:amount]
    e.date_cash = Date.strptime(exp[:date_cash], "%m/%d/%Y")
    e.category_id = exp[:category_id]
    e.deprec_months = exp[:deprec_months]
    e.method_id = exp[:method_id]
    e.user_id = exp[:user_id]
    e.is_outlier = exp[:is_outlier]
    e.save
  end





