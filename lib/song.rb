require_relative './concerns/findable.rb'

class Song

    extend Concerns::Findable

    attr_accessor :name, :genre
    attr_reader :artist

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(song_name)
        song = self.new(song_name)
        song.save
        return song
    end

    def self.new_from_filename(file)
        passed_file = file.split(/\ - |\./)
        filename = passed_file[1]
        song = self.find_or_create_by_name(filename)
        song.artist = Artist.find_or_create_by_name(passed_file[0])
        song.genre = Genre.find_or_create_by_name(passed_file[2])
        song
    end

    def self.create_from_filename(file)
        self.new_from_filename(file)
    end

    

    
end