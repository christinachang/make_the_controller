class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end

  def new
    @artist = Artist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artist }
    end
  end

  def create
    # TODO: fill me in!
    @artist = Artist.new(params[:artist])
    @artist.songs_attributes=(params[:song][:name])

    # 3.times do
    # @artist.songs.build(name: data)
    # end

    if @artist.save
      redirect_to @artist, notice: 'Artist was successfully created.'
    else
      format.html { render action: "new" }
    end
  end
end
