module Sektor
  class Track
    attr_reader :id, :artist, :title, :time, :size, :bitrate, :link

    def initialize(id, artist, title, time, size, bitrate, link)
      @id = id
      @artist = artist
      @title = title
      @time = time
      @size = size
      @bitrate = bitrate
      @link = link
    end
  end
end

