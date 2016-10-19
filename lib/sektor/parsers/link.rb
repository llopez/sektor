module Sektor
  module Parser
    class Link
      def initialize(id)
        @id = id
      end

      def parse
        "http://s.myfreemp3.space/s.php?q=#{@id}"
      end
    end
  end
end

