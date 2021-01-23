class Artist
    extend Concerns::Findable
    @@all = []
    attr_accessor :name 
    def initialize(name)
        @name = name
        @songs = []
        #save
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
        artist = self.new(name)
        artist.save
        artist
    end
    def songs
        @songs
    end
    def add_song(song)
      song.artist !=nil ? nil : song.artist = self
      songs << song unless songs.include?(song)
    end
    def genres
        songs.map {|song| song.genre}.uniq
    end
end