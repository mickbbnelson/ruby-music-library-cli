class MusicLibraryController

    def initialize(path = "./db/mp3s")           #import the path to to songs folder
        music_importer = MusicImporter.new(path)  #Call on the initialize method with new sending through the path to mp3's folder
        music_importer.import
    end

    def call
        input = ""
        while input != "exit"
        puts "Welcome to your music library!"
        puts "What would you like to do?"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        input = gets.strip
            case input 
            when "list songs"
                list_songs
            when "list artists"
                list_artists
            when "list genres"
                list_genres
            when "list artist"
                list_songs_by_artist
            when "list genre"
                list_songs_by_genre
            when "play song"
                play_song
            end
        end
    end

    def list_songs
        songs = Song.all.sort {|x, y| x.name <=> y.name}        #Sort using the spaceship operator to compare song names
        songs.each.with_index(1) do |song, index|
           puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        artists = Artist.all.sort {|x, y| x.name <=> y.name}
        artists.each.with_index(1) do |artist, index|
            puts "#{index}. #{artist.name}"
        end
    end

    def list_genres
        genres = Genre.all.sort {|x, y| x.name <=> y.name}
        genres.each.with_index(1) do |genre, index|
            puts "#{index}. #{genre.name}"
        end
    end

    
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        #artist_songs = Artist.songs.sort {|x, y| x.name <=> y.name}
        artist_songs = Song.all.select do |songs|
            songs.artist == input
        end
        artist_songs1 = artist_songs.sort{|x, y| x.name <=> y.name}
        binding.pry
        artist_songs1.each.with_index(1) do |song, index|
            puts "#{index}. #{song.name}"
        end

  
    end

    def list_songs_by_genre

    end

    #def self.find(input)                    
     #   self.all.detect do |person|
      #      person.name.downcase == input.downcase
       # end
   # end

    def play_song

    end

end


