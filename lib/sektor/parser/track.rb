module Sektor
  module Parser
    class Track
      def initialize(fragment)
        @fragment = fragment
      end

      def parse
        @fragment.css("li.track").map do |fragment|
          id = Id.new(fragment).parse
          artist = Artist.new(fragment).parse
          title = Title.new(fragment).parse
          time = Time.new(fragment).parse

          size = Size.new(id).parse
          bitrate = Bitrate.new(id).parse
          link = Link.new(id).parse

          [id, artist, title, time, size, bitrate, link]
        end
      end
    end
  end
end

