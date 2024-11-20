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
end
