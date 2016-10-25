require 'test_helper'

class TrackParserTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("track_fragment.html", "test/data")
    @res = Minitest::Mock.new
    @res.expect :body, "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>"
    @res.expect :body, "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>"
  end

  def test_parse
    Net::HTTP.stub :post_form, @res do
      assert_equal({
        id: '-50678799_422765730',
        title: 'We Are The Champions',
        artist: 'Freddie Mercury & Queen',
        time: '3:02',
        size: '1.40',
        bitrate: 64,
        link: "http://s.myfreemp3.space/s.php?q=-50678799_422765730"
      }, Sektor::TrackParser.parse(@html))
    end
  end
end
