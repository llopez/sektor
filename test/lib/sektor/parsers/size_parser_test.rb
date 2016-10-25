require 'test_helper'

class SizeParserTest < Minitest::Test
  def setup
    @res = Minitest::Mock.new
    @res.expect :body, "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>"
    @html = File.read File.expand_path("track_fragment.html", "test/data")
  end

  def test_parse
    Net::HTTP.stub :post_form, @res do
      assert_equal "1.40",
        Sektor::SizeParser.parse(@html)
    end
  end
end
