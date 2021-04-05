
class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        @path2 = @path + "/**/*"
        @path3 = Dir[@path2].map{|file| File.basename(file)}
    end

    def import 
        songs = self.files
        songs.each do |song|
            Song.create_from_filename(song)
        end

    end

end