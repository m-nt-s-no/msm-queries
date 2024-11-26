class DirectorsController < ApplicationController
  def show_all
    directors = Director.all
    @dir_array = []
    directors.each do |dir|
      @id, @image, @name, @dob, @bio = dir.id, dir.image, dir.name, dir.dob, dir.bio
      @dir_array.push([@id, @image, @name, @dob, @bio])
    end
    render({:template => "/all_directors"})
  end

  def youngest
    latest_dob = Director.maximum(:dob)
    @dob = latest_dob.strftime("%B %-d, %Y")
    youngest = Director.where(:dob => latest_dob)
    @youngest_name = youngest.at(0).name
    @youngest_id = youngest.at(0).id
    render({:template => "/youngest"})
  end

  def oldest
    earliest_dob = Director.minimum(:dob)
    @dob = earliest_dob.strftime("%B %-d, %Y")
    oldest = Director.where(:dob => earliest_dob)
    @oldest_name = oldest.at(0).name
    @oldest_id = oldest.at(0).id
    render({:template => "/oldest"})
  end

  def show_director
    @id = params.fetch("id")
    @director = Directors.where(:id => @id).at(0)
    @movies = Movies.where(:director_id => @id)
    render({:template => "/details"})
  end
end
