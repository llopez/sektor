require 'test_helper'

class SizeParserTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("track_fragment.html", "test/data")

    stub_request(:post, "http://www.my-free-mp3.org/bitrate/").
      to_return(:status => 200, :body => "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>", :headers => {}) 
  end

  def test_parse
    assert_equal "1.40",
      Sektor::SizeParser.parse(@html)
  end
end
