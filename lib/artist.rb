class Artist

    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        save
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
        artist = new(name)
        artist.save
        artist
    end 

    def add_song(song)
        song.artist.include?(song)
        songs
    end

    def genre
        songs.collect{|s| s.genre}.uniq
    end

end 