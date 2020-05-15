class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
      @genre = current_genre
      erb :'/genres/show'
  end

  def current_genre
    @genre = Genre.find_by_slug(params[:slug])
  end
end