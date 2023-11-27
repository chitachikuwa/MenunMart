class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if admin_sigend_in?
      @recipe.admin_in = current_admin.in
    end
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end    

  private
  def recipe_params
    params.require(:recipe).permit(:image, :title, :category_id, :ingredients, :steps)   
  end  
end
