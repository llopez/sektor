require 'test_helper'

class BitrateParserTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("track_fragment.html", "test/data")

    stub_request(:post, "https://www.example.com/bitrate/").
      to_return(:status => 200, :body => "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>", :headers => {})
  end

  def test_parse
    assert_equal 64, Sektor::BitrateParser.parse(@html)
  end
end
