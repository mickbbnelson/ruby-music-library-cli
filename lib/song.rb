

class Song
    extend Concerns::Findable
    attr_accessor :name, :genre
    attr_reader :artist
    @@all = []

    def initialize(name, artist = nil, genre = nil)          #creates the option to input an artist or genre.  Won't break if 
        @name = name                            #artist and genre are not entered.
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def self.all
        @@all
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name, artist = nil, genre = nil)
        new(name, artist, genre).tap{|song| song.save} 
    end

    #def self.find_by_name(name)
     #    self.all.detect {|song|
      #      song.name == name}
    #end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(file_name)
        song_info = file_name.split(" - ")
        song_name = song_info[1]
        artist_name = song_info[0]
        genre_name = song_info[2].gsub(".mp3", "")
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        self.new(song_name, artist, genre)
    end

    def self.create_from_filename(file_name)
        self.new_from_filename(file_name).save
 #       song_info = file_name.split(" - ")
  #      song_name = song_info[1]
  #      artist_name = song_info[0]
  #      genre_name = song_info[2].gsub(".mp3", "")
  #      artist = Artist.find_or_create_by_name(artist_name)
  #      genre = Genre.find_or_create_by_name(genre_name)
  #      self.create(song_name, artist, genre)
    end

end

