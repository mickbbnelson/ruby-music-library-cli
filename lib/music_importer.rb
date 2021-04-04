class MusicImporter
    attr_accessor :path
    

    def initialize(path)
        @path = path
    end

    def files
        files = Dir.entries(path)           #Dir.entries returns an array the filenames in a given directory
        files.slice(2, files.size)
    end

    def import
        files.each do |filename|
        Song.create_from_filename(filename)
        end
    end

    #def import
    #    files.each do |filename|
    #        Song.new_by_filename(filename)
    #    end 
    #end


end

#def files          Code from prior MP3 method.
 #   mp3s = Dir.entries(path)
 #   mp3s.slice(2, mp3s.size)
#end

#def import
#    files.each do |filename|
#        Song.new_by_filename(filename)
#    end 
#end