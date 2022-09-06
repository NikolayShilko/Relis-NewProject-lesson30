#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter:"sqlite3",database: "barbershop.db"}

class Client < ActiveRecord::Base
  # подключение валидации
  validates :name,presence: true,length: {minimum: 3}
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
  @c=Client.new
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
  @c=Client.new params[:client]
  if @c.save 
    erb "<h2> Спасибо, вы записались </h2>"
  else
    # вывод сообщения об ошибке
     @error=@c.errors.full_messages.first
     erb :visit

 end
  #erb "Уважаемый #{@username},ваш номер телефона #{@phone} мы ждём вас #{@datetime} у выбранного парикмахера #{@barber}."
	
end
#универсальный обработчик списка barberов
get '/barber/:id' do
  #метод find для обработки url по id
  @barber=Barber.find(params[:id])
  erb :barber
end
get '/booking' do
  @client=Client.all
  erb :booking
end
