require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []  

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #class constructor
    song = Song.new() #initializing our song
    self.all.push(song) #saving our song
    # of self.all << (song) <--another method to push/shovel
    return song #return song
  end

  def self.new_by_name(song_name)
    song = Song.new()
    song.name = song_name #assigning our variable 'song' using an instance method '.name' to song_name
    self.all << song
    return song
  end

  def self.create_by_name(song_name)
    song = Song.new()
    song.name = song_name
    self.all << song
   # Song.all.include?(song) idk why this didnt work. it should return a true value?? i think it's bc i had "self.all << song" commented out
    return song
  end

  def self.find_by_name(song_name)
    find_song = self.all.find do |song_list|
      song_list.name == song_name
    end
    find_song
  end

  def self.find_or_create_by_name(song_name)
    prevent_duplicate = self.find_by_name(song_name) #we want to 'find' before we 'create'
    if prevent_duplicate 
      prevent_duplicate
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |item|
      item.name
    end
  end

  def self.new_from_filename(filename)
    artist = filename.split('-')[0].strip #delimiter - .
    song = filename.split('-')[1].split('.')[0].strip 
    new_song = Song.new
    new_song.name = song
    # self.all << song
    new_song.artist_name = artist
    return new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

  def self.destroy_all
    self.all.clear
  end
  
end
