class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        new(name).tap{|artist| artist.save}   #.tap allows you to tap into the results of a method call to perform additional operations.
    end                                        #we're using tap to save the artist instance

    def songs
        Song.all.select {|song| song.artist = self}
    end

    def add_song(song)
        song.artist = self unless song.artist == self
        @songs << song unless @songs.include?(song)
    end

    def genres

    end

end