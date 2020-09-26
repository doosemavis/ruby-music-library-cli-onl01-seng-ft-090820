class Song
    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
    end 

    def artist=(artist)
        @artist = artist
        artist.add_song
    end 

    def genre=(genre)
        @genre = genre
    end 

    def self.all
        @@all << self
    end 

    def save
        self.class.all << self 
    end 

    def self.destroy_all
        all.clear
    end 

    def self.create(name)
        song = new(name)
        song.save
        song
    end 

    def self.find_by_name(name)
        all.detect{|s| s.name == name}
    end 

    def find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end 


end 