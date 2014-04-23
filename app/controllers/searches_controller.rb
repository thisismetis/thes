class SearchesController < ApplicationController
  def new
  end

  def show
    @profiles = find_profiles.includes(:talent)
  end

  private

  def find_profiles
    searcher = Searcher.new(params[:search])
    searcher.profiles
  end
end
