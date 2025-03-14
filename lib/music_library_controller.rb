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

    end

    def list_genres

    end

    
    def list_songs_by_artist 

    end

    def list_songs_by_genre

    end

    def play_song

    end

end


