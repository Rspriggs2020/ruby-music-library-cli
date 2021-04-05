require_relative './concerns/findable.rb'

class Genre

    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
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

    def self.create(name)
        new_genre = Genre.new(name)
        new_genre.save
        return new_genre
    end

    def songs
        songs = Song.all.select do |song|
            song.genre == self
        end
        songs
    end

    def artists
        artists = self.songs.collect do |song|
            song.artist
        end
        artists.uniq
    end
end