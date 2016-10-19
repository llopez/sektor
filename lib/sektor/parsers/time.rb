module Sektor
  module Parser
    class Time
      def initialize(fragment)
        @fragment = fragment
      end

      def parse
        @fragment.css("div.add_panel div.track_time").text.strip
      end
    end
  end
end

