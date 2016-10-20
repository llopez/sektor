require 'test_helper'

class TrackTest < Minitest::Test
  def setup
    html = File.read File.expand_path("track_fragment.html", "test/data")
    @fragment = Nokogiri::HTML(html)
    @res = Minitest::Mock.new
    @res.expect :body, "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>" 
    @res.expect :body, "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>" 
  end

  def test_parse
    Net::HTTP.stub :post_form, @res do
      assert_equal [
        '-50678799_422765730',
        'Freddie Mercury & Queen',
        'We Are The Champions',
        '3:02',
        '1.40',
        64,
        "http://s.myfreemp3.space/s.php?q=-50678799_422765730" 
      ], Sektor::Parser::Track.new(@fragment).parse
    end
  end
end
