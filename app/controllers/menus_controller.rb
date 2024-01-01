class MenusController < ApplicationController
  def index
    @menus = Menu.all 
  end

  def new
    @selected_date = params[:date].to_date
    @day_of_week = @selected_date.strftime('%A')
  end
  
  def create
  end  
end
