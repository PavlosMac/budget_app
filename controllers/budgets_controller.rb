require('pry-byebug')
require_relative('../models/transaction')
require_relative('../models/category')
require_relative('../models/merchant')
require_relative('../models/budget')


get '/budgets' do
    @budgets = Budget.all
    @budget_total = Budget.total
    erb(:'budgets/index')
end

get '/budgets/new' do
    @categories = Category.all
    @transaction = Transaction.all
    erb(:'budgets/new')
end

post '/budgets' do
    @budget = Budget.new( params )
    @budget.save
    redirect to('/budgets')
end


get '/budgets/:id' do
    @budget = Budget.find( params[:id] )
    erb(:'budgets/show')
end


get '/budgets/:id/edit' do
  @budget = Budget.find( params[:id] )
    erb(:'budgets/edit')
end


put '/budgets/:id' do
  Budget.update( params )
  redirect to("/budgets")
end



delete '/budgets/:id' do
    @budget = Budget.delete( params[:id] )
    redirect to('/budgets')
end
