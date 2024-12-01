class ActorsController < ApplicationController
  def show_all
    actors = Actor.all
    @actor_array = []
    actors.each do |actor|
      @id, @image, @name, @dob = actor.id, actor.image, actor.name, actor.dob
      @actor_array.push([@id, @image, @name, @dob])
    end
    render({:template => "/all_actors"})
  end

  def show_actor
    @id = params.fetch("id")
    @actor = Actor.where(:id => @id).at(0).as_json
    @filmography = []
    chars = Character.where(:actor_id => @id)
    chars.each do |char|
      @movie_id, @char_name = char.movie_id, char.name
      movie = Movie.where(:id => @movie_id).at(0)
      @movie_title, @movie_year = movie.title, movie.year
      @director_name = Director.where(:id => movie.director_id).at(0).name
      @filmography.push([@movie_title, @movie_year, @director_name, @char_name, @movie_id])
    end
    render({:template => "/details/actor"})
  end
end
