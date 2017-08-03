class MoviesController < ApplicationController

before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    if params[:movie_genre].blank?
      @movies = Movie.all.order("created_at DESC")
    else
      @movie_genre_id = MovieGenre.find_by(name: params[:movie_genre]).id
      @movies = Movie.where(movie_genre_id: @movie_genre_id).order("created_at DESC")
    end
  end
  
  def show

  end

  def new
    @movie = current_user.movies.build
    @movie_genres = MovieGenre.all.map {|c| [c.name, c.id] }
  end

  def create
    @movie = current_user.movies.build(movie_params)
    @movie.movie_genre_id = params[:movie_genre_id]

    if @movie.save
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :run_time, :movie_genre)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
