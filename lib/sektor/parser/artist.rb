module Sektor
  module Parser
    class Artist
      def initialize(fragment)
        @fragment = fragment
      end

      def parse
        @fragment.css("div.track_name b.artist").text.strip
      end
    end
  end
end

