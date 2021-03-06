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
    self.all << song
    song
  end 
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    self.all << song
    song 
  end 

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) 
      self.find_by_name(name) 
    else 
      self.create_by_name(name)
    end 
  end 
    
  def self.alphabetical 
    self.all.sort {|name_1, name_2| name_1.name <=> name_2.name}
  end 
  
  def self.new_from_filename(name)
    split_array = name.split(" - ")
    song = self.new 
    song.name = split_array[1].gsub(".mp3", "") 
    song.artist_name = split_array[0]
    song
  end 
  
  def self.create_from_filename(name)
    self.all << new_from_filename(name)
  end 
  
  def self.destroy_all
    self.all.clear
  end 

end
