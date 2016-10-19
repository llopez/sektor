module Sektor
  module Parser
    class Bitrate
      def initialize(id)
        @id = id
      end

      def parse
        uri = URI("http://www.my-free-mp3.org/bitrate/")
        res = Net::HTTP.post_form(uri, id: @id)
        res.body.split(" ")[4].to_i
      end
    end
  end
end

