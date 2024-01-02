class MenusController < ApplicationController
  def index
    @menus = Menu.where
  end

  def new
    @selected_date = params[:date].to_date
    @day_of_week = @selected_date.strftime('%A')
    @menu = Menu.new
    search_term = params[:recipe_search_term]
    @recipes = Recipe.where("name LIKE ?", "%#{search_term}%") if search_term.present?
  end
  
  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to root_path
    else
      renndr :new
    end  
  end  


  private

  def menu_params
    params.require(:menu).permit(:date, :name, :description)
  end
end
