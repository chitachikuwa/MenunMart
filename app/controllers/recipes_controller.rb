class RecipesController < ApplicationController
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
    @recipe = Recipe.find(params[:id])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:image, :title, :category_id, :ingredients, :seasonings,:steps)   
  end  
end
