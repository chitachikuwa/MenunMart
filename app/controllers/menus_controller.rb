class MenusController < ApplicationController
  def index
    @menus = Menu.all 
  end

  def new
  end
  
  def create
  end  
end
