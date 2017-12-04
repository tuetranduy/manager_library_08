class StaticPagesController < ApplicationController
  def home
    @categories = Category.sort_by_alphabet
  end
end
