class ArtistsController < ApplicationController

  get '/artists' do
    @artist = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
      @artist = current_artist
      erb :'/artists/show'
  end

  def current_artist
    @artist = Artist.find_by_slug(params[:slug])
  end

end
