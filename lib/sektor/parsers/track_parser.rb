module Sektor
  module TrackParser
    def self.parse(fragment)
      {
        id: IdParser.parse(fragment),
        artist: ArtistParser.parse(fragment),
        title: TitleParser.parse(fragment),
        time: TimeParser.parse(fragment),
        size: SizeParser.parse(fragment),
        bitrate: BitrateParser.parse(fragment),
        link: LinkParser.parse(fragment)
      }
    end
  end
end
