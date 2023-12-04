class RecipesController < ApplicationController
  
  #before_action :admin_scan, only: [:edit]
  before_action :set_recipe, only: [:show, :edit, :update]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe_ingredients = @recipe.recipe_ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if current_user&.admin?
      @recipe.admin_id = current_user.id
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
  #def admin_scan
    #unless current_user&.admin?
      #redirect_to root_path
   #end  
  #end

  def recipe_params
    params.require(:recipe).permit(:image, :title, :category_id, :ingredients, :seasonings, :steps, :quantity).merge(admin_id: current_admin.id)  
  end  

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end  
end
