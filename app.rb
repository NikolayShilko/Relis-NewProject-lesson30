#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter:"sqlite3",database: "barbershop.db"}

class Client < ActiveRecord::Base
end
class Barber < ActiveRecord::Base
end

before do
@barbers=Barber.all
end

get '/' do
    @barbers=Barber.all
	erb :index
end
get '/visit' do
	erb :visit
end
post '/visit' do
#	@username=params[:username]
#	@phone = params[:phone]
 #   @datetime = params[:datetime]
  #   @barber = params[:barber]
  #  c=Client.new
  #  c.name=@username
  #  c.phone=@phone
  #  c.datestamp=@datetime
  #  c.barber=@barber
  #  c.save
  c=Client.new params[:client]
  c.save 
 
  erb "Уважаемый #{@username},ваш номер телефона #{@phone} мы ждём вас #{@datetime} у выбранного парикмахера #{@barber}."
	
end