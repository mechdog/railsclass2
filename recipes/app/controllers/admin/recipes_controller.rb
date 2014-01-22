class Admin::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy
    redirect_to admin_recipes_path, notice: 'Deleted the record'
  end

end
