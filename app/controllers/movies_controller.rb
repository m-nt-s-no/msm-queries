class MoviesController < ApplicationController
  def show_all
    movies = Movie.all
    @movie_array = []
    movies.each do |movie|
      @id, @image, @title, @year = movie.id, movie.image, movie.title, movie.year
      @director = Director.where(:id => movie.director_id).at(0).name
      @movie_array.push([@id, @image, @title, @year, @director])
    end
    render({:template => "/all_movies"})
  end

  def show_movie
    @id = params.fetch("id")
    @movie = Movie.where(:id => @id).at(0).as_json
    render({:template => "/details/movie"})
  end
end
