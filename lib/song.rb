require "pry"

class Song

  attr_accessor :name, :artist

  def self.new_by_filename(filename)
    song = self.new(filename.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.artist.add_song(song)
  end

  def initialize(name)
    self.name = name
  end
  
end