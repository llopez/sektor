module Sektor
  module Parser
    class Id
      def initialize(fragment)
        @fragment = fragment
      end

      def parse
        @fragment.css("a.info").attr("data-aid").value
      end
    end
  end
end

