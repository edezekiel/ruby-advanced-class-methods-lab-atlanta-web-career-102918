class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song = self.create
    song_name = File.basename(filename, ".mp3").split(" - ")[-1]
    artist_name = File.basename(filename, ".mp3").split(" - ")[0]
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.create
    song_name = File.basename(filename, ".mp3").split(" - ")[-1]
    artist_name = File.basename(filename, ".mp3").split(" - ")[0]
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end
