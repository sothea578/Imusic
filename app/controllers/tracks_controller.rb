class TracksController < ApplicationController
  attr_reader :track

  def index
    if params[:search]
      @tracks = Track.search(params[:search]).select(:id, :title, :song,
        :user_id, :genre, :description, :image)
    else
      @tracks = Track.select(:id, :title, :song, :user_id,
        :genre, :description, :image)
    end
  end

  def new
    @track ||= Track.new
  end

  def create
    @track = Track.new track_params
    if track.save
      flash[:success] = t ".success"
      redirect_to "/pages/home"
    else
      render :new
    end
  end

  private

  def track_params
    params.require(:track).permit :title, :description, :genre_id, :song, :user_id
  end
end
