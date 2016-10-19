module Sektor
  module Parser
    class Title
      def initialize(fragment)
        @fragment = fragment
      end

      def parse
        @fragment.css("div.track_name span.name").text.strip
      end
    end
  end
end

