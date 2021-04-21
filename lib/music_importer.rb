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
end
