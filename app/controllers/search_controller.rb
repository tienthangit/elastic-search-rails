class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @articles = []
    else
      @articles = Article.search params[:q]
    end

    if params[:query].nil?
      @songs = []
    else
      @songs = Song.search params[:query]
    end
  end

end
