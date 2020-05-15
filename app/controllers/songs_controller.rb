class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
      @song = Song.create(params[:song])
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song.genre_ids = params[:genres]
      @song.save
      flash[:message] = "Successfully created song."
      redirect ("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = current_song
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
      @song = current_song
      @song.update(params[:song])
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song.genre_ids = params[:genres]
      @song.save
      flash[:message] = "Successfully updated song."
      redirect ("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = current_song
    erb :'/songs/show'
  end

  def current_song
    @song = Song.find_by_slug(params[:slug])
  end

end