require "find"
require "pry"

class MP3Importer
  
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    mp3s = []
    Find.find(self.path) do |file_path|
      mp3s << file_path.split("/").last if file_path.end_with?(".mp3")
    end
    mp3s
  end
  
  def import
    self.files.each do |song_filename|
      Song.new_by_filename(song_filename)
    end
  end
  
end