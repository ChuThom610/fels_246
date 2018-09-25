class WordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @words = Word.load_words.page(params[:page]).per Settings.rows
  end
end
