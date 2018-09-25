class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_categories, only: :index
  before_action :load_category, only: :show
  before_action :load_words, only: :show

  def index; end

  def show; end

  private

  def load_categories
    @categories = Category.all
  end

  def load_words
    @words = @category.words
    # return if @words
    # redirect_to @category
  end

  def load_category
    @category = Category.find_by id: params[:id]
  end
end
