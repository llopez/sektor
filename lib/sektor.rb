require "sektor/version"
require "nokogiri"
require "open-uri"
require "sektor/track"
require "net/http"

module Sektor


  def self.search(title)
    url_encoded_title = CGI.escape(title)

    doc = Nokogiri::HTML(open("http://www.my-free-mp3.org/mp3/#{url_encoded_title}?_pjax=true"))

    li_tracks = doc.css("li.track")

    result = li_tracks.map do |li_track|
   
      artist = li_track.css("div.track_name b.artist").text.strip
      title = li_track.css("div.track_name span.name").text.strip
      time = li_track.css("div.add_panel div.track_time").text.strip

      uri = URI("http://www.my-free-mp3.org/bitrate/")

      id = li_track.css("a.info").attr('data-aid').value

      res = Net::HTTP.post_form(uri, id: id)

      size = res.body.split(" ")[1]
      bitrate = res.body.split(" ")[4]

      dw_link = "http://s.myfreemp3.space/s.php?q=#{id}"

      [artist, title, time, size, bitrate, dw_link]
    end

    parse(result)
  end

  def self.parse(result)
    result.map{ |r| Track.new(*r) }
  end

end
