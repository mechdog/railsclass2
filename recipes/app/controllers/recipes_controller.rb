class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def like
    recipe = Recipe.find(params[:id])

    recipe.likes += 1
    recipe.save!

    redirect_to recipe_path(recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # recipe_params = params[:recipe].permit(
    #   :name, :description, :preparation_time, :servings_yielded) #replaced below
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  private

  def recipe_params
    params[:recipe].permit(
      :name, :description, :preparation_time, :servings_yielded)
  end

end
