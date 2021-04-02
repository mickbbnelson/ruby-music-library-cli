

class Song
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

    def self.create(name)
        new(name).tap{|song| song.save} 
    end
end