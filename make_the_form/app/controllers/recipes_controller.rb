class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new()
    @recipe.name = params[:recipe][:name]

    @recipe.description = params[:recipe][:description]

    params[:recipe][:ingredients].each do |ingredient_values|
      @recipe.ingredients.build(ingredient_values)
      # ingredient = Ingredient.new
      # item.each do |ingredient|
      #   ingredient.name = ingredient[:name]
      #   ingredient.amount = ingredient[:amount]
      # end
      # @recipe.ingredients << ingredient
    end

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render action: "new"
    end
  end

  def index
    @recipes = Recipe.all
  end

end
