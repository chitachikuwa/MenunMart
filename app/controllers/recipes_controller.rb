class RecipesController < ApplicationController
  before_action :check_admin, only: [:new, :edit, :update]
  before_action :set_recipe, only: [:show, :edit, :update]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if admin_signed_in?
      @recipe.admin_id = current_admin.id
    end
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end     

  def show
  end

  def edit
  end  

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path
    else
      render :edit
    end
  end      

  private

  def check_admin
    unless current_admin == @recipe.admin
      redirect_to root_path
    end
  end  

  def recipe_params
    params.require(:recipe).permit(:image, :title, :category_id, :ingredients, :seasonings,:steps)   
  end  

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end  
end
