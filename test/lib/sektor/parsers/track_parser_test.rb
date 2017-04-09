require 'test_helper'

class TrackParserTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("track_fragment.html", "test/data")
    stub_request(:post, "https://www.example.com/bitrate/").
      to_return(:status => 200, :body => "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>", :headers => {})
  end

  def test_parse
    assert_equal({
      id: '-50678799_422765730',
      title: 'We Are The Champions',
      artist: 'Freddie Mercury & Queen',
      time: 182,
      size: 1433,
      bitrate: 64,
      link: "https://mp3mp3.site/start.php?q=-50678799_422765730"
    }, Sektor::TrackParser.parse(@html))
  end
end
