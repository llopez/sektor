module Sektor
  class Track
    attr_reader :artist, :title, :time, :size, :bitrate, :link

    def initialize(artist, title, time, size, bitrate, link)
      @artist = artist
      @title = title
      @time = time
      @size = size
      @bitrate = bitrate
      @link = link
    end
  end
end

