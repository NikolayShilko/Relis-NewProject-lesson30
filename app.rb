#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter:"sqlite3",database: "barbershop.db"}

class Client < ActiveRecord::Base
  # подключение валидации
  validates :name,presence: true
  validates :phone,presence: true
  validates :datestamp,presence: true
  validates :barber,presence: true
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
# Ламерский способ записив бд  
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
  #Трушный способ записи в бд
  c=Client.new params[:client]
  c.save 
 
  erb "Уважаемый #{@username},ваш номер телефона #{@phone} мы ждём вас #{@datetime} у выбранного парикмахера #{@barber}."
	
end