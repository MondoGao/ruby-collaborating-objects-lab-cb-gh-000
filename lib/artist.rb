require "pry"

class Artist
  @@all = []

  def self.all
    @@all
  end
  
  def self.find_or_create_by_name(name)
    exist_artist = self.all.detect do |artist|
      artist.name == name
    end
    exist_artist ||= self.new(name)
  end
  
  attr_accessor :name, :songs

  def initialize(name)
    self.name = name
    self.songs = []
    self.class.all << self
  end
    
  def add_song(song)
    self.songs << song
    song.artist = self
    song
  end

  def save
    self.class.all << self
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end
  
end